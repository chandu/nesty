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
