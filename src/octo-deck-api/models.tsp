namespace OctoDeckApi {
  model Card {
    githubId: string;
    userName: string;
    fullName: string;
    iconUrl: string;
    identicon: Identicon;
  }
  model Identicon {
    /**
     * カラーコード 例: #RRGGBB
     */
    color: string;

    /**
     * 5x5の二次元配列。trueがブロック
     */
    blocks: boolean[][];
  }
  model Contribution {
    date: plainDate;
    count: int32;
    type: "commit" | "pull_request" | "issue" | "review";
  }
  model UserStats {
    contributions: Contribution[];
  }
  model Community {
    id: string;
    name: string;
  }
}
