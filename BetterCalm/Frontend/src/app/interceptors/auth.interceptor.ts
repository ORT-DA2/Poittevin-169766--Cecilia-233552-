import {Injectable} from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import {Observable} from 'rxjs';
import {AuthenticationService} from '../services/Authentication/authentication.service';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {

  constructor(
    private auth: AuthenticationService
  ) {
  }

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    const authToken = this.auth.getAuthorizationToken();
    let authReq = request.clone({
      headers: request.headers.set('Authorization', authToken)
    });
    authReq = request.clone({
      headers: authReq.headers.set('Content-Type', 'application/json')
    });
    return next.handle(authReq);
  }
}
