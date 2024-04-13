#!/bin/bash

# Create project directory
mkdir nest-api-library-consumer
cd nest-api-library-consumer

# Create src directory
mkdir src
cd src

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

# Create app module file
touch app.module.ts

# Write code into app module file
cat <<EOF > app.module.ts
import { Module } from '@nestjs/common';
import { AuthModule } from '../path/to/your/library/auth/auth.module';

@Module({
  imports: [
    AuthModule.register({
      // Override options if needed
      secret: 'newSecret',
      expiresIn: '2h',
    }),
  ],
})
export class AppModule {}
EOF

# Create package.json file
touch package.json

# Write code into package.json file
cat <<EOF > package.json
{
  "name": "nest-api-library-consumer",
  "version": "1.0.0",
  "description": "Example NestJS API Library Consumer",
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
# Nest API Library Consumer

This is an example NestJS API Library Consumer demonstrating how to use and override functionality provided by the library.

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
