; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_18_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  br label %source, !dbg !74

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !75), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !77, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !80, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !103, metadata !DIExpression()), !dbg !104
  store i32 -1, i32* %connectSocket, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  br label %do.body, !dbg !107

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !108
  store i32 %call, i32* %connectSocket, align 4, !dbg !110
  %0 = load i32, i32* %connectSocket, align 4, !dbg !111
  %cmp = icmp eq i32 %0, -1, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !115

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !117
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !118
  store i16 2, i16* %sin_family, align 4, !dbg !119
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !120
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !121
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !122
  store i32 %call1, i32* %s_addr, align 4, !dbg !123
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !124
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !125
  store i16 %call2, i16* %sin_port, align 2, !dbg !126
  %2 = load i32, i32* %connectSocket, align 4, !dbg !127
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !129
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !130
  %cmp4 = icmp eq i32 %call3, -1, !dbg !131
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !132

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !133

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !135
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !136
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !137
  %conv = trunc i64 %call7 to i32, !dbg !137
  store i32 %conv, i32* %recvResult, align 4, !dbg !138
  %5 = load i32, i32* %recvResult, align 4, !dbg !139
  %cmp8 = icmp eq i32 %5, -1, !dbg !141
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !142

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !143
  %cmp10 = icmp eq i32 %6, 0, !dbg !144
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !145

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !146

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !148
  %idxprom = sext i32 %7 to i64, !dbg !149
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !149
  store i8 0, i8* %arrayidx, align 1, !dbg !150
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !151
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !152
  store i32 %call15, i32* %data, align 4, !dbg !153
  br label %do.end, !dbg !154

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !155
  %cmp16 = icmp ne i32 %8, -1, !dbg !157
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !158

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !159
  %call19 = call i32 @close(i32 %9), !dbg !161
  br label %if.end20, !dbg !162

if.end20:                                         ; preds = %if.then18, %do.end
  br label %sink, !dbg !163

sink:                                             ; preds = %if.end20
  call void @llvm.dbg.label(metadata !164), !dbg !165
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !166, metadata !DIExpression()), !dbg !171
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !171
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !171
  %11 = load i32, i32* %data, align 4, !dbg !172
  %cmp21 = icmp sge i32 %11, 0, !dbg !174
  br i1 %cmp21, label %if.then23, label %if.else, !dbg !175

if.then23:                                        ; preds = %sink
  %12 = load i32, i32* %data, align 4, !dbg !176
  %idxprom24 = sext i32 %12 to i64, !dbg !178
  %arrayidx25 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom24, !dbg !178
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !178
  call void @printIntLine(i32 %13), !dbg !179
  br label %if.end26, !dbg !180

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !181
  br label %if.end26

if.end26:                                         ; preds = %if.else, %if.then23
  ret void, !dbg !183
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #2

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #5

declare dso_local i64 @recv(i32, i8*, i64, i32) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #5

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_18_good() #0 !dbg !184 {
entry:
  call void @goodB2G(), !dbg !185
  call void @goodG2B(), !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !188 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !193, metadata !DIExpression()), !dbg !194
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !195, metadata !DIExpression()), !dbg !196
  %call = call i64 @time(i64* null) #7, !dbg !197
  %conv = trunc i64 %call to i32, !dbg !198
  call void @srand(i32 %conv) #7, !dbg !199
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !200
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_18_good(), !dbg !201
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !202
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !203
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_18_bad(), !dbg !204
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !205
  ret i32 0, !dbg !206
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !207 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !208, metadata !DIExpression()), !dbg !209
  store i32 -1, i32* %data, align 4, !dbg !210
  br label %source, !dbg !211

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !212), !dbg !213
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !214, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !219, metadata !DIExpression()), !dbg !220
  store i32 -1, i32* %connectSocket, align 4, !dbg !220
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !221, metadata !DIExpression()), !dbg !222
  br label %do.body, !dbg !223

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !224
  store i32 %call, i32* %connectSocket, align 4, !dbg !226
  %0 = load i32, i32* %connectSocket, align 4, !dbg !227
  %cmp = icmp eq i32 %0, -1, !dbg !229
  br i1 %cmp, label %if.then, label %if.end, !dbg !230

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !231

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !233
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !233
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !234
  store i16 2, i16* %sin_family, align 4, !dbg !235
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !236
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !237
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !238
  store i32 %call1, i32* %s_addr, align 4, !dbg !239
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !240
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !241
  store i16 %call2, i16* %sin_port, align 2, !dbg !242
  %2 = load i32, i32* %connectSocket, align 4, !dbg !243
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !245
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !246
  %cmp4 = icmp eq i32 %call3, -1, !dbg !247
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !248

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !249

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !251
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !252
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !253
  %conv = trunc i64 %call7 to i32, !dbg !253
  store i32 %conv, i32* %recvResult, align 4, !dbg !254
  %5 = load i32, i32* %recvResult, align 4, !dbg !255
  %cmp8 = icmp eq i32 %5, -1, !dbg !257
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !258

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !259
  %cmp10 = icmp eq i32 %6, 0, !dbg !260
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !261

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !262

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !264
  %idxprom = sext i32 %7 to i64, !dbg !265
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !265
  store i8 0, i8* %arrayidx, align 1, !dbg !266
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !267
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !268
  store i32 %call15, i32* %data, align 4, !dbg !269
  br label %do.end, !dbg !270

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !271
  %cmp16 = icmp ne i32 %8, -1, !dbg !273
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !274

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !275
  %call19 = call i32 @close(i32 %9), !dbg !277
  br label %if.end20, !dbg !278

if.end20:                                         ; preds = %if.then18, %do.end
  br label %sink, !dbg !279

sink:                                             ; preds = %if.end20
  call void @llvm.dbg.label(metadata !280), !dbg !281
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !282, metadata !DIExpression()), !dbg !284
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !284
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !284
  %11 = load i32, i32* %data, align 4, !dbg !285
  %cmp21 = icmp sge i32 %11, 0, !dbg !287
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !288

land.lhs.true:                                    ; preds = %sink
  %12 = load i32, i32* %data, align 4, !dbg !289
  %cmp23 = icmp slt i32 %12, 10, !dbg !290
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !291

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !292
  %idxprom26 = sext i32 %13 to i64, !dbg !294
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !294
  %14 = load i32, i32* %arrayidx27, align 4, !dbg !294
  call void @printIntLine(i32 %14), !dbg !295
  br label %if.end28, !dbg !296

if.else:                                          ; preds = %land.lhs.true, %sink
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !297
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  ret void, !dbg !299
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !300 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !301, metadata !DIExpression()), !dbg !302
  store i32 -1, i32* %data, align 4, !dbg !303
  br label %source, !dbg !304

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !305), !dbg !306
  store i32 7, i32* %data, align 4, !dbg !307
  br label %sink, !dbg !308

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !309), !dbg !310
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !311, metadata !DIExpression()), !dbg !313
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !313
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !313
  %1 = load i32, i32* %data, align 4, !dbg !314
  %cmp = icmp sge i32 %1, 0, !dbg !316
  br i1 %cmp, label %if.then, label %if.else, !dbg !317

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !318
  %idxprom = sext i32 %2 to i64, !dbg !320
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !320
  %3 = load i32, i32* %arrayidx, align 4, !dbg !320
  call void @printIntLine(i32 %3), !dbg !321
  br label %if.end, !dbg !322

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !323
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !325
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_18.c", directory: "/root/SSE-Assessment")
!2 = !{!3, !16}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !4, line: 24, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15}
!7 = !DIEnumerator(name: "SOCK_STREAM", value: 1)
!8 = !DIEnumerator(name: "SOCK_DGRAM", value: 2)
!9 = !DIEnumerator(name: "SOCK_RAW", value: 3)
!10 = !DIEnumerator(name: "SOCK_RDM", value: 4)
!11 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5)
!12 = !DIEnumerator(name: "SOCK_DCCP", value: 6)
!13 = !DIEnumerator(name: "SOCK_PACKET", value: 10)
!14 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288)
!15 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048)
!16 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !17, line: 40, baseType: !5, size: 32, elements: !18)
!17 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!18 = !{!19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44}
!19 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!20 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!21 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!22 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!23 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!24 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!25 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!26 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!27 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!28 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!29 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!30 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!31 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!32 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!33 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!34 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!35 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!36 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!37 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!38 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!39 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!40 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!41 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!42 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!43 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!44 = !DIEnumerator(name: "IPPROTO_MAX", value: 256)
!45 = !{!46, !5}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 175, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 177, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 178, baseType: !55, size: 112, offset: 16)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 112, elements: !57)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !{!58}
!58 = !DISubrange(count: 14)
!59 = !{i32 7, !"Dwarf Version", i32 4}
!60 = !{i32 2, !"Debug Info Version", i32 3}
!61 = !{i32 1, !"wchar_size", i32 4}
!62 = !{i32 7, !"uwtable", i32 1}
!63 = !{i32 7, !"frame-pointer", i32 2}
!64 = !{!"clang version 13.0.0"}
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_18_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_18.c", directory: "/root/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocation(line: 49, column: 5, scope: !65)
!75 = !DILabel(scope: !65, name: "source", file: !66, line: 50)
!76 = !DILocation(line: 50, column: 1, scope: !65)
!77 = !DILocalVariable(name: "recvResult", scope: !78, file: !66, line: 56, type: !71)
!78 = distinct !DILexicalBlock(scope: !65, file: !66, line: 51, column: 5)
!79 = !DILocation(line: 56, column: 13, scope: !78)
!80 = !DILocalVariable(name: "service", scope: !78, file: !66, line: 57, type: !81)
!81 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !82)
!82 = !{!83, !84, !90, !97}
!83 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !81, file: !17, line: 239, baseType: !51, size: 16)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !81, file: !17, line: 240, baseType: !85, size: 16, offset: 16)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !86)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !87, line: 25, baseType: !88)
!87 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !89, line: 39, baseType: !53)
!89 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !81, file: !17, line: 241, baseType: !91, size: 32, offset: 32)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !92)
!92 = !{!93}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !91, file: !17, line: 33, baseType: !94, size: 32)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !87, line: 26, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !89, line: 41, baseType: !5)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !81, file: !17, line: 244, baseType: !98, size: 64, offset: 64)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !99, size: 64, elements: !100)
!99 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!100 = !{!101}
!101 = !DISubrange(count: 8)
!102 = !DILocation(line: 57, column: 28, scope: !78)
!103 = !DILocalVariable(name: "connectSocket", scope: !78, file: !66, line: 58, type: !71)
!104 = !DILocation(line: 58, column: 16, scope: !78)
!105 = !DILocalVariable(name: "inputBuffer", scope: !78, file: !66, line: 59, type: !55)
!106 = !DILocation(line: 59, column: 14, scope: !78)
!107 = !DILocation(line: 60, column: 9, scope: !78)
!108 = !DILocation(line: 70, column: 29, scope: !109)
!109 = distinct !DILexicalBlock(scope: !78, file: !66, line: 61, column: 9)
!110 = !DILocation(line: 70, column: 27, scope: !109)
!111 = !DILocation(line: 71, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !66, line: 71, column: 17)
!113 = !DILocation(line: 71, column: 31, scope: !112)
!114 = !DILocation(line: 71, column: 17, scope: !109)
!115 = !DILocation(line: 73, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !66, line: 72, column: 13)
!117 = !DILocation(line: 75, column: 13, scope: !109)
!118 = !DILocation(line: 76, column: 21, scope: !109)
!119 = !DILocation(line: 76, column: 32, scope: !109)
!120 = !DILocation(line: 77, column: 39, scope: !109)
!121 = !DILocation(line: 77, column: 21, scope: !109)
!122 = !DILocation(line: 77, column: 30, scope: !109)
!123 = !DILocation(line: 77, column: 37, scope: !109)
!124 = !DILocation(line: 78, column: 32, scope: !109)
!125 = !DILocation(line: 78, column: 21, scope: !109)
!126 = !DILocation(line: 78, column: 30, scope: !109)
!127 = !DILocation(line: 79, column: 25, scope: !128)
!128 = distinct !DILexicalBlock(scope: !109, file: !66, line: 79, column: 17)
!129 = !DILocation(line: 79, column: 40, scope: !128)
!130 = !DILocation(line: 79, column: 17, scope: !128)
!131 = !DILocation(line: 79, column: 85, scope: !128)
!132 = !DILocation(line: 79, column: 17, scope: !109)
!133 = !DILocation(line: 81, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !66, line: 80, column: 13)
!135 = !DILocation(line: 85, column: 31, scope: !109)
!136 = !DILocation(line: 85, column: 46, scope: !109)
!137 = !DILocation(line: 85, column: 26, scope: !109)
!138 = !DILocation(line: 85, column: 24, scope: !109)
!139 = !DILocation(line: 86, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !109, file: !66, line: 86, column: 17)
!141 = !DILocation(line: 86, column: 28, scope: !140)
!142 = !DILocation(line: 86, column: 44, scope: !140)
!143 = !DILocation(line: 86, column: 47, scope: !140)
!144 = !DILocation(line: 86, column: 58, scope: !140)
!145 = !DILocation(line: 86, column: 17, scope: !109)
!146 = !DILocation(line: 88, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !140, file: !66, line: 87, column: 13)
!148 = !DILocation(line: 91, column: 25, scope: !109)
!149 = !DILocation(line: 91, column: 13, scope: !109)
!150 = !DILocation(line: 91, column: 37, scope: !109)
!151 = !DILocation(line: 93, column: 25, scope: !109)
!152 = !DILocation(line: 93, column: 20, scope: !109)
!153 = !DILocation(line: 93, column: 18, scope: !109)
!154 = !DILocation(line: 94, column: 9, scope: !109)
!155 = !DILocation(line: 96, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !78, file: !66, line: 96, column: 13)
!157 = !DILocation(line: 96, column: 27, scope: !156)
!158 = !DILocation(line: 96, column: 13, scope: !78)
!159 = !DILocation(line: 98, column: 26, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !66, line: 97, column: 9)
!161 = !DILocation(line: 98, column: 13, scope: !160)
!162 = !DILocation(line: 99, column: 9, scope: !160)
!163 = !DILocation(line: 107, column: 5, scope: !65)
!164 = !DILabel(scope: !65, name: "sink", file: !66, line: 108)
!165 = !DILocation(line: 108, column: 1, scope: !65)
!166 = !DILocalVariable(name: "buffer", scope: !167, file: !66, line: 110, type: !168)
!167 = distinct !DILexicalBlock(scope: !65, file: !66, line: 109, column: 5)
!168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !169)
!169 = !{!170}
!170 = !DISubrange(count: 10)
!171 = !DILocation(line: 110, column: 13, scope: !167)
!172 = !DILocation(line: 113, column: 13, scope: !173)
!173 = distinct !DILexicalBlock(scope: !167, file: !66, line: 113, column: 13)
!174 = !DILocation(line: 113, column: 18, scope: !173)
!175 = !DILocation(line: 113, column: 13, scope: !167)
!176 = !DILocation(line: 115, column: 33, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !66, line: 114, column: 9)
!178 = !DILocation(line: 115, column: 26, scope: !177)
!179 = !DILocation(line: 115, column: 13, scope: !177)
!180 = !DILocation(line: 116, column: 9, scope: !177)
!181 = !DILocation(line: 119, column: 13, scope: !182)
!182 = distinct !DILexicalBlock(scope: !173, file: !66, line: 118, column: 9)
!183 = !DILocation(line: 122, column: 1, scope: !65)
!184 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_18_good", scope: !66, file: !66, line: 236, type: !67, scopeLine: 237, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!185 = !DILocation(line: 238, column: 5, scope: !184)
!186 = !DILocation(line: 239, column: 5, scope: !184)
!187 = !DILocation(line: 240, column: 1, scope: !184)
!188 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 251, type: !189, scopeLine: 252, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!189 = !DISubroutineType(types: !190)
!190 = !{!71, !71, !191}
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 64)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!193 = !DILocalVariable(name: "argc", arg: 1, scope: !188, file: !66, line: 251, type: !71)
!194 = !DILocation(line: 251, column: 14, scope: !188)
!195 = !DILocalVariable(name: "argv", arg: 2, scope: !188, file: !66, line: 251, type: !191)
!196 = !DILocation(line: 251, column: 27, scope: !188)
!197 = !DILocation(line: 254, column: 22, scope: !188)
!198 = !DILocation(line: 254, column: 12, scope: !188)
!199 = !DILocation(line: 254, column: 5, scope: !188)
!200 = !DILocation(line: 256, column: 5, scope: !188)
!201 = !DILocation(line: 257, column: 5, scope: !188)
!202 = !DILocation(line: 258, column: 5, scope: !188)
!203 = !DILocation(line: 261, column: 5, scope: !188)
!204 = !DILocation(line: 262, column: 5, scope: !188)
!205 = !DILocation(line: 263, column: 5, scope: !188)
!206 = !DILocation(line: 265, column: 5, scope: !188)
!207 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 129, type: !67, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!208 = !DILocalVariable(name: "data", scope: !207, file: !66, line: 131, type: !71)
!209 = !DILocation(line: 131, column: 9, scope: !207)
!210 = !DILocation(line: 133, column: 10, scope: !207)
!211 = !DILocation(line: 134, column: 5, scope: !207)
!212 = !DILabel(scope: !207, name: "source", file: !66, line: 135)
!213 = !DILocation(line: 135, column: 1, scope: !207)
!214 = !DILocalVariable(name: "recvResult", scope: !215, file: !66, line: 141, type: !71)
!215 = distinct !DILexicalBlock(scope: !207, file: !66, line: 136, column: 5)
!216 = !DILocation(line: 141, column: 13, scope: !215)
!217 = !DILocalVariable(name: "service", scope: !215, file: !66, line: 142, type: !81)
!218 = !DILocation(line: 142, column: 28, scope: !215)
!219 = !DILocalVariable(name: "connectSocket", scope: !215, file: !66, line: 143, type: !71)
!220 = !DILocation(line: 143, column: 16, scope: !215)
!221 = !DILocalVariable(name: "inputBuffer", scope: !215, file: !66, line: 144, type: !55)
!222 = !DILocation(line: 144, column: 14, scope: !215)
!223 = !DILocation(line: 145, column: 9, scope: !215)
!224 = !DILocation(line: 155, column: 29, scope: !225)
!225 = distinct !DILexicalBlock(scope: !215, file: !66, line: 146, column: 9)
!226 = !DILocation(line: 155, column: 27, scope: !225)
!227 = !DILocation(line: 156, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !66, line: 156, column: 17)
!229 = !DILocation(line: 156, column: 31, scope: !228)
!230 = !DILocation(line: 156, column: 17, scope: !225)
!231 = !DILocation(line: 158, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !66, line: 157, column: 13)
!233 = !DILocation(line: 160, column: 13, scope: !225)
!234 = !DILocation(line: 161, column: 21, scope: !225)
!235 = !DILocation(line: 161, column: 32, scope: !225)
!236 = !DILocation(line: 162, column: 39, scope: !225)
!237 = !DILocation(line: 162, column: 21, scope: !225)
!238 = !DILocation(line: 162, column: 30, scope: !225)
!239 = !DILocation(line: 162, column: 37, scope: !225)
!240 = !DILocation(line: 163, column: 32, scope: !225)
!241 = !DILocation(line: 163, column: 21, scope: !225)
!242 = !DILocation(line: 163, column: 30, scope: !225)
!243 = !DILocation(line: 164, column: 25, scope: !244)
!244 = distinct !DILexicalBlock(scope: !225, file: !66, line: 164, column: 17)
!245 = !DILocation(line: 164, column: 40, scope: !244)
!246 = !DILocation(line: 164, column: 17, scope: !244)
!247 = !DILocation(line: 164, column: 85, scope: !244)
!248 = !DILocation(line: 164, column: 17, scope: !225)
!249 = !DILocation(line: 166, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !244, file: !66, line: 165, column: 13)
!251 = !DILocation(line: 170, column: 31, scope: !225)
!252 = !DILocation(line: 170, column: 46, scope: !225)
!253 = !DILocation(line: 170, column: 26, scope: !225)
!254 = !DILocation(line: 170, column: 24, scope: !225)
!255 = !DILocation(line: 171, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !225, file: !66, line: 171, column: 17)
!257 = !DILocation(line: 171, column: 28, scope: !256)
!258 = !DILocation(line: 171, column: 44, scope: !256)
!259 = !DILocation(line: 171, column: 47, scope: !256)
!260 = !DILocation(line: 171, column: 58, scope: !256)
!261 = !DILocation(line: 171, column: 17, scope: !225)
!262 = !DILocation(line: 173, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !256, file: !66, line: 172, column: 13)
!264 = !DILocation(line: 176, column: 25, scope: !225)
!265 = !DILocation(line: 176, column: 13, scope: !225)
!266 = !DILocation(line: 176, column: 37, scope: !225)
!267 = !DILocation(line: 178, column: 25, scope: !225)
!268 = !DILocation(line: 178, column: 20, scope: !225)
!269 = !DILocation(line: 178, column: 18, scope: !225)
!270 = !DILocation(line: 179, column: 9, scope: !225)
!271 = !DILocation(line: 181, column: 13, scope: !272)
!272 = distinct !DILexicalBlock(scope: !215, file: !66, line: 181, column: 13)
!273 = !DILocation(line: 181, column: 27, scope: !272)
!274 = !DILocation(line: 181, column: 13, scope: !215)
!275 = !DILocation(line: 183, column: 26, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !66, line: 182, column: 9)
!277 = !DILocation(line: 183, column: 13, scope: !276)
!278 = !DILocation(line: 184, column: 9, scope: !276)
!279 = !DILocation(line: 192, column: 5, scope: !207)
!280 = !DILabel(scope: !207, name: "sink", file: !66, line: 193)
!281 = !DILocation(line: 193, column: 1, scope: !207)
!282 = !DILocalVariable(name: "buffer", scope: !283, file: !66, line: 195, type: !168)
!283 = distinct !DILexicalBlock(scope: !207, file: !66, line: 194, column: 5)
!284 = !DILocation(line: 195, column: 13, scope: !283)
!285 = !DILocation(line: 197, column: 13, scope: !286)
!286 = distinct !DILexicalBlock(scope: !283, file: !66, line: 197, column: 13)
!287 = !DILocation(line: 197, column: 18, scope: !286)
!288 = !DILocation(line: 197, column: 23, scope: !286)
!289 = !DILocation(line: 197, column: 26, scope: !286)
!290 = !DILocation(line: 197, column: 31, scope: !286)
!291 = !DILocation(line: 197, column: 13, scope: !283)
!292 = !DILocation(line: 199, column: 33, scope: !293)
!293 = distinct !DILexicalBlock(scope: !286, file: !66, line: 198, column: 9)
!294 = !DILocation(line: 199, column: 26, scope: !293)
!295 = !DILocation(line: 199, column: 13, scope: !293)
!296 = !DILocation(line: 200, column: 9, scope: !293)
!297 = !DILocation(line: 203, column: 13, scope: !298)
!298 = distinct !DILexicalBlock(scope: !286, file: !66, line: 202, column: 9)
!299 = !DILocation(line: 206, column: 1, scope: !207)
!300 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 209, type: !67, scopeLine: 210, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!301 = !DILocalVariable(name: "data", scope: !300, file: !66, line: 211, type: !71)
!302 = !DILocation(line: 211, column: 9, scope: !300)
!303 = !DILocation(line: 213, column: 10, scope: !300)
!304 = !DILocation(line: 214, column: 5, scope: !300)
!305 = !DILabel(scope: !300, name: "source", file: !66, line: 215)
!306 = !DILocation(line: 215, column: 1, scope: !300)
!307 = !DILocation(line: 218, column: 10, scope: !300)
!308 = !DILocation(line: 219, column: 5, scope: !300)
!309 = !DILabel(scope: !300, name: "sink", file: !66, line: 220)
!310 = !DILocation(line: 220, column: 1, scope: !300)
!311 = !DILocalVariable(name: "buffer", scope: !312, file: !66, line: 222, type: !168)
!312 = distinct !DILexicalBlock(scope: !300, file: !66, line: 221, column: 5)
!313 = !DILocation(line: 222, column: 13, scope: !312)
!314 = !DILocation(line: 225, column: 13, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !66, line: 225, column: 13)
!316 = !DILocation(line: 225, column: 18, scope: !315)
!317 = !DILocation(line: 225, column: 13, scope: !312)
!318 = !DILocation(line: 227, column: 33, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !66, line: 226, column: 9)
!320 = !DILocation(line: 227, column: 26, scope: !319)
!321 = !DILocation(line: 227, column: 13, scope: !319)
!322 = !DILocation(line: 228, column: 9, scope: !319)
!323 = !DILocation(line: 231, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !315, file: !66, line: 230, column: 9)
!325 = !DILocation(line: 234, column: 1, scope: !300)
