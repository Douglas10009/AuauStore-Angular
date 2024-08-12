import { Component } from '@angular/core';
import { HeaderComponent } from "../header/header.component";
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-not-found',
  standalone: true,
  imports: [HeaderComponent, RouterLink],
  templateUrl: './not-found.component.html',
  styleUrl: './not-found.component.scss'
})
export class NotFoundComponent {

}
