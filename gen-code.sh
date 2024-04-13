#!/bin/bash

# Create project directory
mkdir nest-api-library-example
cd nest-api-library-example

# Create src directory
mkdir src
cd src

# Create auth module directory
mkdir auth
cd auth

# Create auth module files
touch auth.module.ts
touch auth.controller.ts
touch auth.service.ts
touch auth.middleware.ts
touch auth.interceptor.ts

# Write code into auth module files
cat <<EOF > auth.module.ts
import { Module, DynamicModule } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { AuthMiddleware } from './auth.middleware';
import { AuthInterceptor } from './auth.interceptor';

@Module({})
export class AuthModule {
  static register(options): DynamicModule {
    return {
      module: AuthModule,
      providers: [
        AuthService,
        { provide: 'OPTIONS', useValue: options },
        AuthMiddleware,
        AuthInterceptor,
      ],
      controllers: [AuthController],
    };
  }
}
EOF

cat <<EOF > auth.controller.ts
import { Controller, Get } from '@nestjs/common';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Get('login')
  login() {
    return this.authService.login();
  }
}
EOF

cat <<EOF > auth.service.ts
import { Injectable } from '@nestjs/common';

@Injectable()
export class AuthService {
  login() {
    // Default login implementation
  }
}
EOF

cat <<EOF > auth.middleware.ts
import { Injectable, NestMiddleware } from '@nestjs/common';
import { Request, Response } from 'express';

@Injectable()
export class AuthMiddleware implements NestMiddleware {
  use(req: Request, res: Response, next: Function) {
    // Default middleware implementation
    next();
  }
}
EOF

cat <<EOF > auth.interceptor.ts
import { Injectable, NestInterceptor, ExecutionContext, CallHandler } from '@nestjs/common';
import { Observable } from 'rxjs';

@Injectable()
export class AuthInterceptor implements NestInterceptor {
  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    // Default interceptor implementation
    return next.handle();
  }
}
EOF

# Navigate back to src directory
cd ..

# Create app module file
touch app.module.ts

# Write code into app module file
cat <<EOF > app.module.ts
import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';

@Module({
  imports: [
    AuthModule.register({
      // Default options
      secret: 'defaultSecret',
      expiresIn: '1h',
    }),
  ],
})
export class AppModule {}
EOF

# Create main file
touch main.ts

# Write code into main file
cat <<EOF > main.ts
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);
}
bootstrap();
EOF

# Navigate back to root directory
cd ../..

# Create package.json file
touch package.json

# Write code into package.json file
cat <<EOF > package.json
{
  "name": "nest-api-library-example",
  "version": "1.0.0",
  "description": "Example NestJS API Library",
  "scripts": {
    "start": "nest start",
    "start:dev": "nest start --watch",
    "start:debug": "nest start --debug --watch",
    "start:prod": "nest start --prod",
    "lint": "eslint src/**/*.{ts,js}",
    "test": "jest",
    "test:watch": "jest --watch",
    "test:cov": "jest --coverage",
    "test:e2e": "jest --config ./test/jest-e2e.json",
    "format": "prettier --write \"src/**/*.ts\""
  },
  "jest": {
    "moduleFileExtensions": [
      "js",
      "json",
      "ts"
    ],
    "rootDir": "src",
    "testRegex": ".spec.ts$",
    "transform": {
      "^.+\\.(t|j)s$": "ts-jest"
    },
    "coverageDirectory": "../coverage",
    "testEnvironment": "node"
  },
  "devDependencies": {
    "@nestjs/cli": "^8.0.0",
    "@nestjs/common": "^8.0.0",
    "@nestjs/core": "^8.0.0",
    "@nestjs/platform-express": "^8.0.0",
    "jest": "^27.0.6",
    "prettier": "^2.4.1",
    "ts-jest": "^27.0.4",
    "ts-node": "^10.4.0",
    "typescript": "^4.4.3"
  },
  "dependencies": {
    "reflect-metadata": "^0.1.13",
    "rxjs": "^7.5.0"
  }
}
EOF

# Create tsconfig.json file
touch tsconfig.json

# Write code into tsconfig.json file
cat <<EOF > tsconfig.json
{
  "compilerOptions": {
    "module": "commonjs",
    "declaration": true,
    "removeComments": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "target": "ES2018",
    "outDir": "./dist",
    "baseUrl": "./",
    "incremental": true,
    "paths": {
      "*": ["node_modules/*"]
    }
  }
}
EOF

# Create README.md file
touch README.md

# Write code into README.md file
cat <<EOF > README.md
# Nest API Library Example

This is an example NestJS API Library demonstrating the open/closed principle of SOLID.

## Installation

\`\`\`bash
pnpm install
\`\`\`

## Usage

\`\`\`bash
pnpm start
\`\`\`

## License

[MIT](LICENSE)
EOF

echo "Project files and directories created successfully."
