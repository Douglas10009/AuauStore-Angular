import { Component } from '@angular/core';
import { HeaderComponent } from "../../components/header/header.component";
import { RouterLink } from '@angular/router';
import { FooterComponent } from "../../components/footer/footer.component";

@Component({
  selector: 'app-not-found',
  standalone: true,
  imports: [HeaderComponent, RouterLink, FooterComponent],
  templateUrl: './not-found.component.html',
  styleUrl: './not-found.component.scss'
})
export class NotFoundComponent {

}
