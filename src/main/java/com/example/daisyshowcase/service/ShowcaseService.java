package com.example.daisyshowcase.service;

import com.example.daisyshowcase.model.*;
import org.springframework.stereotype.Service;
import java.util.*;

@Service
public class ShowcaseService {
    private static final List<ShowcasePage> PAGES = List.of(
        page("components","Component gallery","Foundations","The UI toolkit","Everyday interface building blocks, shown in useful states.","◈"),
        page("themes","Theme laboratory","Foundations","Color systems","One interface, nine distinct visual identities.","◐"),
        page("responsive","Responsive laboratory","Foundations","Every viewport","A single composition that adapts from phone to wide desktop.","▦"),
        page("forms","Forms & validation","Foundations","Data entry","Accessible input patterns with Spring MVC validation.","✎"),
        page("workspace-form","Application form workspace","Foundations","A focused workspace","A responsive, full-width form with its own navigation and diverse input controls.","▧"),
        page("data","Data management","Foundations","Work with records","Search, filter, select, and paginate a realistic queue.","▤"),
        page("analytics","Analytics dashboard","Business applications","Measure what matters","Executive metrics, goals, and performance signals.","▥"),
        page("crm","CRM workspace","Business applications","Customer intelligence","A relationship-focused sales and account workspace.","◎"),
        page("erp","ERP operations","Business applications","Connected operations","Purchasing, inventory, production, and approvals.","▣"),
        page("finance","Finance & accounting","Business applications","Financial clarity","Cash, invoices, expenses, and budget control.","◇"),
        page("hr","People & HR","Business applications","The human side","Employee services, leave, onboarding, and culture.","♧"),
        page("projects","Project workspace","Business applications","Ship together","A practical board for tasks, milestones, and teams.","▥"),
        page("itsm","IT service desk","Enterprise solutions","Service reliability","Tickets, ownership, SLA signals, and incident context.","◉"),
        page("cloud","Cloud operations","Enterprise solutions","Infrastructure at a glance","Applications, deployments, utilization, and logs.","☁"),
        page("security","Security operations","Enterprise solutions","Protect the business","Prioritized detections and investigation workflow.","⬡"),
        page("ecommerce","Commerce admin","Enterprise solutions","Run the storefront","Orders, catalog, inventory, and fulfillment.","▧"),
        page("logistics","Supply chain tower","Enterprise solutions","Move with confidence","Shipments, routes, warehouses, and exceptions.","↗"),
        page("healthcare","Care administration","Enterprise solutions","Coordinate the day","Fictional scheduling, capacity, and staff operations.","✚"),
        page("saas","Subscription admin","Enterprise solutions","Grow recurring revenue","Plans, account health, billing, and entitlements.","✳"),
        page("approvals","Approval center","Enterprise solutions","Keep work moving","Review requests with context, risk, and history.","✓"),
        page("executive","Executive command","Enterprise solutions","The full picture","A company-wide operating view for leadership.","✦"),
        page("overview","Time command center","Time management","Workforce pulse","Attendance, capacity, leave and exceptions in one operating view.","◷"),
        page("access","Time access","Time management","Clock in and out","A self-service time terminal with an auditable event trail.","◉"),
        page("timesheet","My timesheet","Time management","Every hour accounted for","Review daily work, breaks, overtime and corrections.","▤"),
        page("department","Department clockings","Time management","The whole month","Every employee and every day, with reconciled totals.","▦"),
        page("schedules","Shift planning","Time management","Coverage by design","Plan shifts, handovers and capacity across teams.","▥"),
        page("leave","Leave management","Time management","Time away, planned well","Request leave and see balances, conflicts and team absence.","◇"),
        page("holidays","Holiday calendar","Time management","Regional calendars","Public holidays, closures and entitlements in one place.","✳"),
        page("approvals-time","Time approvals","Time management","Decisions with context","Review leave, corrections and overtime requests.","✓"),
        page("exceptions","Attendance exceptions","Time management","Resolve anomalies","Investigate missing punches, lateness and overtime.","⚑"),
        page("reports","Time reports","Time management","Turn hours into insight","Trends, utilization, absence and exportable summaries.","↗")
    );
    private static ShowcasePage page(String slug,String title,String category,String eyebrow,String description,String icon) {
        return new ShowcasePage(slug,title,category,eyebrow,description,icon);
    }
    public List<ShowcasePage> pages() { return PAGES; }
    public Optional<ShowcasePage> page(String slug) { return PAGES.stream().filter(p->p.slug().equals(slug)).findFirst(); }

    public DemoData data(String slug) {
        return switch (slug) {
            case "analytics" -> data("Performance snapshot","Export report","Revenue is tracking ahead","The current quarter is 12.8% above plan, led by expansion accounts.",78,
                metrics("Revenue|€2.84M|↑ 12.8%|success","Active customers|8,492|↑ 6.4%|info","Conversion|4.8%|↑ 0.6 pts|success","NPS|62|↑ 4 pts|warning"),
                records("North region|Enterprise segment|Mara Novak|On track|success|€1.21M","Central region|Mid-market|Luka Horvat|On track|success|€940K","South region|New business|Iva Kovač|Watch|warning|€680K"));
            case "crm" -> data("Accounts to watch","Add customer","Relationship health","Acme Industries has three open opportunities and a renewal due in 42 days.",84,
                metrics("Pipeline|€1.48M|↑ 18%|success","Open deals|34|6 closing soon|info","Accounts|218|12 new|success","Renewals|9|Next 30 days|warning"),
                records("Acme Industries|Manufacturing · 240 employees|Ana Marić|Healthy|success|€210K","Northstar Labs|Technology · 85 employees|Marko Babić|At risk|warning|€86K","Meridian Group|Professional services|Petra Jurić|Healthy|success|€142K","Lumen Works|Retail · 140 employees|Ivan Radić|New|info|€64K"));
            case "erp" -> data("Operations overview","New purchase order","Approval needed","Three supplier requests exceed their delegated spending thresholds.",72,
                metrics("Open orders|1,284|↑ 8%|info","Inventory value|€4.6M|Stable|success","Production OEE|87.3%|↑ 2.1 pts|success","Approvals|12|3 urgent|warning"),
                records("PO-10482|Steel components · Orion Supply|Nina Perić|Awaiting approval|warning|€48,200","WH-0241|Central warehouse transfer|Tomislav Barić|In transit|info|420 units","PR-8820|Assembly line B run|Ema Vuković|Scheduled|success|1,600 units","INV-7624|Quarterly cycle count|Luka Horvat|Attention|error|18 variances"));
            case "finance" -> data("Recent transactions","Create invoice","Cash outlook","Expected receivables cover the next 90 days of planned operating expenses.",68,
                metrics("Cash position|€3.42M|↑ 5.2%|success","Revenue|€1.96M|This month|info","Receivables|€428K|14 overdue|warning","Payables|€312K|Due this month|neutral"),
                records("INV-2028|Acme Industries · subscription|Ana Marić|Paid|success|€42,800","INV-2029|Meridian Group · services|Petra Jurić|Pending|warning|€18,450","EXP-1142|Cloud infrastructure|M. Babić|Approved|success|€9,840","INV-2030|Lumen Works · implementation|Ivan Radić|Overdue|error|€12,600"));
            case "hr" -> data("People directory","Add employee","People pulse","Onboarding completion is improving; two new colleagues start next Monday.",91,
                metrics("Employees|486|↑ 12 this quarter|success","Open roles|18|6 interviews|info","Leave requests|7|Awaiting review|warning","Engagement|82%|↑ 3 pts|success"),
                records("Mia Kovač|Product Design · Zagreb|Design|Available|success|5 years","Noah Petrović|Engineering · Split|Platform|On leave|info|3 years","Sara Novak|Customer Success · Remote|Success|Available|success|2 years","Leo Marić|Finance · Zagreb|Finance|Onboarding|warning|New"));
            case "projects" -> data("Sprint delivery","Create task","Milestone approaching","The customer portal beta is planned for Friday. Two review items remain.",64,
                metrics("Active projects|12|3 strategic|info","Tasks done|128|This sprint|success","In review|9|2 blocked|warning","Team capacity|76%|Healthy|success"),
                records("PRJ-412|Customer portal beta|Mia Kovač|In review|warning|Fri 02 Oct","PRJ-386|Billing API migration|Noah Petrović|In progress|info|Tue 06 Oct","PRJ-421|Design system audit|Sara Novak|Done|success|Mon 28 Sep","PRJ-433|Reporting export|Leo Marić|Backlog|neutral|Thu 08 Oct"));
            case "itsm" -> data("Incident queue","New ticket","SLA risk","INC-4821 has 38 minutes remaining before its response target.",61,
                metrics("Open incidents|42|↓ 6 today|success","Critical|2|Needs attention|error","SLA compliance|96.8%|↑ 1.2 pts|success","Service health|99.94%|30-day uptime|info"),
                records("INC-4821|VPN access intermittent|Nina Perić|P1 · Escalated|error|38m SLA","INC-4816|Laptop provisioning|T. Barić|P3 · In progress|info|3h SLA","REQ-7712|New user access|Ema Vuković|P3 · Open|warning|1d SLA","INC-4798|Print service unavailable|Luka Horvat|Resolved|success|Closed"));
            case "cloud" -> data("Service inventory","Deploy service","Infrastructure signal","Production utilization is healthy. One staging deployment needs review.",83,
                metrics("Services|48|46 healthy|success","Instances|132|Across 4 regions|info","CPU usage|43%|Peak 67%|success","Monthly spend|€72.4K|↑ 3.1%|warning"),
                records("api-gateway|Production · eu-central|Platform team|Healthy|success|12 instances","billing-worker|Production · eu-west|Payments team|Healthy|success|8 instances","search-index|Staging · eu-central|Data team|Deploying|info|4 instances","notifications|Production · us-east|Platform team|Degraded|warning|6 instances"));
            case "security" -> data("Investigation queue","Create case","Posture watch","One high-severity alert involves a privileged identity. Triage is underway.",88,
                metrics("Posture score|88/100|↑ 3 pts|success","Active incidents|4|1 high severity|error","Assets monitored|2,418|99.2% coverage|info","Critical patches|7|Due this week|warning"),
                records("SEC-1842|Unusual admin sign-in · IAM|Ivana Kovač|HIGH · Investigating|error|12m ago","SEC-1839|Endpoint malware blocked · EDR|Marko Babić|MEDIUM · Contained|warning|48m ago","SEC-1832|Exposed token revoked · Cloud|Nina Perić|LOW · Resolved|success|2h ago","SEC-1827|Port scan · Network|Luka Horvat|LOW · Monitoring|info|5h ago"));
            case "ecommerce" -> data("Recent orders","Add product","Inventory alert","Two popular products have fewer than 10 units available.",74,
                metrics("Gross sales|€184.2K|↑ 14.2%|success","Orders|1,482|↑ 9.8%|info","Customers|8,924|348 new|success","Low stock|6 SKUs|2 urgent|warning"),
                records("ORD-10582|Studio desk lamp · 2 items|Fictional Customer A|Fulfilled|success|€189","ORD-10583|Everyday tote · 1 item|Fictional Customer B|Packing|info|€42","ORD-10584|Ceramic set · 3 items|Fictional Customer C|Awaiting payment|warning|€126","ORD-10585|Oak side table · 1 item|Fictional Customer D|Shipped|success|€329"));
            case "logistics" -> data("Shipment control","Create shipment","Delivery exception","Shipment SH-2084 is delayed by a carrier handoff in Vienna.",79,
                metrics("In transit|284|Across 18 routes|info","On-time rate|96.4%|↑ 1.8 pts|success","Delayed|8|3 at risk|warning","Warehouses|12|98% available|success"),
                records("SH-2084|Zagreb → Vienna → Munich|Atlas Freight|Delayed|warning|ETA +1 day","SH-2085|Split → Ljubljana|Adria Express|In transit|info|ETA 17:30","SH-2086|Rijeka → Graz|Northline Logistics|Delivered|success|Delivered 09:42","SH-2087|Osijek → Budapest|Atlas Freight|In transit|info|ETA tomorrow"));
            case "healthcare" -> data("Today's appointments","Schedule visit","Fictional demonstration data","All names and appointments on this page are invented for UI demonstration.",67,
                metrics("Appointments|126|Today|info","Checked in|54|43% complete|success","Available rooms|14|Of 22 rooms|success","Staff on duty|38|3 shifts|neutral"),
                records("APT-0142|Fictional Patient A · General care|Dr. Mira Example|Checked in|success|09:30","APT-0143|Fictional Patient B · Imaging|Dr. Luka Sample|Waiting|warning|10:00","APT-0144|Fictional Patient C · Cardiology|Dr. Nika Demo|Scheduled|info|10:30","APT-0145|Fictional Patient D · General care|Dr. Ivan Example|Scheduled|info|11:00"));
            case "saas" -> data("Account portfolio","Create plan","Expansion opportunity","Four teams on Growth are nearing their usage limits this month.",81,
                metrics("MRR|€428K|↑ 11.6%|success","Active accounts|1,284|↑ 86|info","Trials|142|32 convert soon|warning","Gross churn|1.8%|↓ 0.4 pts|success"),
                records("Northstar Labs|Growth · 84 seats|Mia Kovač|Active|success|€2,480/mo","Meridian Group|Enterprise · 220 seats|Ana Marić|Active|success|€8,900/mo","Lumen Works|Starter · 12 seats|Leo Marić|Trial|info|12 days left","Acme Industries|Enterprise · 480 seats|Sara Novak|Payment due|warning|€18,600/mo"));
            case "approvals" -> data("Pending requests","Delegate queue","Review context","The purchase request for network equipment exceeds its department limit.",55,
                metrics("Pending|23|7 assigned to you|warning","Approved today|18|Median 4.2h|success","High risk|2|Need context|error","Delegated|4|This week|info"),
                records("APR-2821|Network equipment purchase|Nina Perić|High risk|error|€24,800","APR-2822|Client travel expense|Marko Babić|Awaiting review|warning|€1,250","APR-2823|Analytics access request|Ema Vuković|Ready|success|Standard","APR-2824|Annual leave · 5 days|Luka Horvat|Ready|success|05–09 Oct"));
            case "executive" -> data("Company performance","Open briefing","Leadership signal","Revenue and customer retention are ahead of plan while delivery risk needs attention.",86,
                metrics("Revenue|€24.8M|↑ 14.6% YoY|success","Customers|12,840|↑ 8.1% YoY|info","Operating margin|22.4%|↑ 1.8 pts|success","Employee NPS|48|↑ 6 pts|warning"),
                records("Growth|Enterprise expansion in EMEA|Revenue team|On track|success|€4.2M pipeline","Operations|Supply chain optimization|COO office|At risk|warning|76% complete","Technology|Cloud modernization|Platform team|On track|success|84% complete","Security|Identity hardening|Security team|Attention|error|7 actions"));
            default -> data("Records","Create record","Sample insight","Explore how the same design system adapts to real work.",75,
                metrics("Records|128|↑ 8%|success","Active|96|This month|info","Pending|18|Needs review|warning","Complete|14|This week|success"),
                records("REC-101|North region initiative|Ana Marić|Active|success|€42,800","REC-102|Central team request|Luka Horvat|Pending|warning|€18,450","REC-103|Platform enhancement|Mia Kovač|Complete|success|€9,840"));
        };
    }
    private static Metric[] metrics(String... values) {
        return Arrays.stream(values).map(v->{String[] p=v.split("\\|",-1);return new Metric(p[0],p[1],p[2],p[3]);}).toArray(Metric[]::new);
    }
    private static DemoRecord[] records(String... values) {
        return Arrays.stream(values).map(v->{String[] p=v.split("\\|",-1);return new DemoRecord("",p[0],p[1],p[2],p[3],p[4],p[5]);}).toArray(DemoRecord[]::new);
    }
    private static DemoData data(String title,String action,String insightTitle,String insightBody,int progress,Metric[] metrics,DemoRecord[] records) {
        return new DemoData(List.of(metrics),List.of(records),title,action,insightTitle,insightBody,progress);
    }
}
