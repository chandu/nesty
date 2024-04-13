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
