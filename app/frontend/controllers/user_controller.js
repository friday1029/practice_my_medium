import { Controller } from "stimulus"
import axios from 'axios'


export default class extends Controller {
  static targets = [ "followButton" ]

  follow(event) {
    event.preventDefault()
    // console.log("hi")
    // this.clapCountTarget.innerHTML = 'David'
    let user = this.followButtonTarget.dataset.user
    let target = this.followButtonTarget
    axios.post(`/api/users/${user}/follow`)
      .then(function (response) {
        let status = response.data.status
        switch(status){
          case 'sign_in_first':
            alert('你必須先登入')
            break
          default:
            target.innerHTML = status
        }
      })
        .catch(function (error) {
            console.log(error)
      })
  }
}
