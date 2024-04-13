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
