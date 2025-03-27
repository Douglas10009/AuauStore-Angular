import { Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { ProductsComponent } from './pages/products/products.component';
import { NotFoundComponent } from './pages/not-found/not-found.component';
import { LoginComponent } from './pages/login/login.component';
import { CadastroComponent } from './pages/cadastro/cadastro.component';
import { SocialMediasComponent } from './pages/social-medias/social-medias.component';
import { CemiterioComponent } from './pages/cemiterio/cemiterio.component';

export const routes: Routes = [
  {
    path: '',
    component: HomeComponent
  },
  {
    path: 'produtos',
    component: ProductsComponent
  },
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: 'cadastro',
    component: CadastroComponent
  },
  {
    path: 'redes-sociais',
    component: SocialMediasComponent
  },
  {
    path: 'cemiterio',
    component: CemiterioComponent
  },
  {
    path: '**',
    component: NotFoundComponent
  },
];
