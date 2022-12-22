; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  %call = call i32 @staticReturnsTrue(), !dbg !35
  %tobool = icmp ne i32 %call, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay3, i8** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx5, align 1, !dbg !54
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %call7 = call i64 @strlen(i8* %arraydecay6) #6, !dbg !56
  store i64 %call7, i64* %destLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !61
  %1 = load i64, i64* %destLen, align 8, !dbg !63
  %cmp = icmp ult i64 %0, %1, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !66
  %3 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx8 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !66
  %4 = load i8, i8* %arrayidx8, align 1, !dbg !66
  %5 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !70
  store i8 %4, i8* %arrayidx9, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %6, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !78
  store i8 0, i8* %arrayidx10, align 1, !dbg !79
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !80
  call void @printLine(i8* %arraydecay11), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_08_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE126_Buffer_Overread__char_declare_loop_08_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__char_declare_loop_08_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !106 {
entry:
  ret i32 1, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !117
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !120
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx2, align 1, !dbg !122
  %call = call i32 @staticReturnsFalse(), !dbg !123
  %tobool = icmp ne i32 %call, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.else, !dbg !125

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !126
  br label %if.end, !dbg !128

if.else:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !129
  store i8* %arraydecay3, i8** %data, align 8, !dbg !131
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !139
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !140
  store i8 0, i8* %arrayidx5, align 1, !dbg !141
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  %call7 = call i64 @strlen(i8* %arraydecay6) #6, !dbg !143
  store i64 %call7, i64* %destLen, align 8, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !148
  %1 = load i64, i64* %destLen, align 8, !dbg !150
  %cmp = icmp ult i64 %0, %1, !dbg !151
  br i1 %cmp, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !153
  %3 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx8 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !153
  %4 = load i8, i8* %arrayidx8, align 1, !dbg !153
  %5 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !157
  store i8 %4, i8* %arrayidx9, align 1, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %6, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !164
  store i8 0, i8* %arrayidx10, align 1, !dbg !165
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !166
  call void @printLine(i8* %arraydecay11), !dbg !167
  ret void, !dbg !168
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !169 {
entry:
  ret i32 0, !dbg !170
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !171 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !172, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !174, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !176, metadata !DIExpression()), !dbg !177
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !178
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !178
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !179
  store i8 0, i8* %arrayidx, align 1, !dbg !180
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !181
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !182
  store i8 0, i8* %arrayidx2, align 1, !dbg !183
  %call = call i32 @staticReturnsTrue(), !dbg !184
  %tobool = icmp ne i32 %call, 0, !dbg !184
  br i1 %tobool, label %if.then, label %if.end, !dbg !186

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !187
  store i8* %arraydecay3, i8** %data, align 8, !dbg !189
  br label %if.end, !dbg !190

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !191, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !196, metadata !DIExpression()), !dbg !197
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !198
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !198
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !199
  store i8 0, i8* %arrayidx5, align 1, !dbg !200
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !201
  %call7 = call i64 @strlen(i8* %arraydecay6) #6, !dbg !202
  store i64 %call7, i64* %destLen, align 8, !dbg !203
  store i64 0, i64* %i, align 8, !dbg !204
  br label %for.cond, !dbg !206

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !207
  %1 = load i64, i64* %destLen, align 8, !dbg !209
  %cmp = icmp ult i64 %0, %1, !dbg !210
  br i1 %cmp, label %for.body, label %for.end, !dbg !211

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !212
  %3 = load i64, i64* %i, align 8, !dbg !214
  %arrayidx8 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !212
  %4 = load i8, i8* %arrayidx8, align 1, !dbg !212
  %5 = load i64, i64* %i, align 8, !dbg !215
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !216
  store i8 %4, i8* %arrayidx9, align 1, !dbg !217
  br label %for.inc, !dbg !218

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !219
  %inc = add i64 %6, 1, !dbg !219
  store i64 %inc, i64* %i, align 8, !dbg !219
  br label %for.cond, !dbg !220, !llvm.loop !221

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !223
  store i8 0, i8* %arrayidx10, align 1, !dbg !224
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !225
  call void @printLine(i8* %arraydecay11), !dbg !226
  ret void, !dbg !227
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 39, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 40, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 41, column: 10, scope: !11)
!29 = !DILocation(line: 42, column: 5, scope: !11)
!30 = !DILocation(line: 43, column: 5, scope: !11)
!31 = !DILocation(line: 43, column: 25, scope: !11)
!32 = !DILocation(line: 44, column: 5, scope: !11)
!33 = !DILocation(line: 45, column: 5, scope: !11)
!34 = !DILocation(line: 45, column: 27, scope: !11)
!35 = !DILocation(line: 46, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 8)
!37 = !DILocation(line: 46, column: 8, scope: !11)
!38 = !DILocation(line: 49, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 47, column: 5)
!40 = !DILocation(line: 49, column: 14, scope: !39)
!41 = !DILocation(line: 50, column: 5, scope: !39)
!42 = !DILocalVariable(name: "i", scope: !43, file: !12, line: 52, type: !44)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 51, column: 5)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 52, column: 16, scope: !43)
!48 = !DILocalVariable(name: "destLen", scope: !43, file: !12, line: 52, type: !44)
!49 = !DILocation(line: 52, column: 19, scope: !43)
!50 = !DILocalVariable(name: "dest", scope: !43, file: !12, line: 53, type: !25)
!51 = !DILocation(line: 53, column: 14, scope: !43)
!52 = !DILocation(line: 54, column: 9, scope: !43)
!53 = !DILocation(line: 55, column: 9, scope: !43)
!54 = !DILocation(line: 55, column: 21, scope: !43)
!55 = !DILocation(line: 56, column: 26, scope: !43)
!56 = !DILocation(line: 56, column: 19, scope: !43)
!57 = !DILocation(line: 56, column: 17, scope: !43)
!58 = !DILocation(line: 59, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !43, file: !12, line: 59, column: 9)
!60 = !DILocation(line: 59, column: 14, scope: !59)
!61 = !DILocation(line: 59, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !12, line: 59, column: 9)
!63 = !DILocation(line: 59, column: 25, scope: !62)
!64 = !DILocation(line: 59, column: 23, scope: !62)
!65 = !DILocation(line: 59, column: 9, scope: !59)
!66 = !DILocation(line: 61, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !12, line: 60, column: 9)
!68 = !DILocation(line: 61, column: 28, scope: !67)
!69 = !DILocation(line: 61, column: 18, scope: !67)
!70 = !DILocation(line: 61, column: 13, scope: !67)
!71 = !DILocation(line: 61, column: 21, scope: !67)
!72 = !DILocation(line: 62, column: 9, scope: !67)
!73 = !DILocation(line: 59, column: 35, scope: !62)
!74 = !DILocation(line: 59, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 62, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 63, column: 9, scope: !43)
!79 = !DILocation(line: 63, column: 21, scope: !43)
!80 = !DILocation(line: 64, column: 19, scope: !43)
!81 = !DILocation(line: 64, column: 9, scope: !43)
!82 = !DILocation(line: 66, column: 1, scope: !11)
!83 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_08_good", scope: !12, file: !12, line: 141, type: !13, scopeLine: 142, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 143, column: 5, scope: !83)
!85 = !DILocation(line: 144, column: 5, scope: !83)
!86 = !DILocation(line: 145, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 157, type: !88, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!90, !90, !91}
!90 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !12, line: 157, type: !90)
!93 = !DILocation(line: 157, column: 14, scope: !87)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !12, line: 157, type: !91)
!95 = !DILocation(line: 157, column: 27, scope: !87)
!96 = !DILocation(line: 160, column: 22, scope: !87)
!97 = !DILocation(line: 160, column: 12, scope: !87)
!98 = !DILocation(line: 160, column: 5, scope: !87)
!99 = !DILocation(line: 162, column: 5, scope: !87)
!100 = !DILocation(line: 163, column: 5, scope: !87)
!101 = !DILocation(line: 164, column: 5, scope: !87)
!102 = !DILocation(line: 167, column: 5, scope: !87)
!103 = !DILocation(line: 168, column: 5, scope: !87)
!104 = !DILocation(line: 169, column: 5, scope: !87)
!105 = !DILocation(line: 171, column: 5, scope: !87)
!106 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !107, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DISubroutineType(types: !108)
!108 = !{!90}
!109 = !DILocation(line: 27, column: 5, scope: !106)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 75, type: !16)
!112 = !DILocation(line: 75, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !12, line: 76, type: !20)
!114 = !DILocation(line: 76, column: 10, scope: !110)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !12, line: 77, type: !25)
!116 = !DILocation(line: 77, column: 10, scope: !110)
!117 = !DILocation(line: 78, column: 5, scope: !110)
!118 = !DILocation(line: 79, column: 5, scope: !110)
!119 = !DILocation(line: 79, column: 25, scope: !110)
!120 = !DILocation(line: 80, column: 5, scope: !110)
!121 = !DILocation(line: 81, column: 5, scope: !110)
!122 = !DILocation(line: 81, column: 27, scope: !110)
!123 = !DILocation(line: 82, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !110, file: !12, line: 82, column: 8)
!125 = !DILocation(line: 82, column: 8, scope: !110)
!126 = !DILocation(line: 85, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 83, column: 5)
!128 = !DILocation(line: 86, column: 5, scope: !127)
!129 = !DILocation(line: 90, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !12, line: 88, column: 5)
!131 = !DILocation(line: 90, column: 14, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !133, file: !12, line: 93, type: !44)
!133 = distinct !DILexicalBlock(scope: !110, file: !12, line: 92, column: 5)
!134 = !DILocation(line: 93, column: 16, scope: !133)
!135 = !DILocalVariable(name: "destLen", scope: !133, file: !12, line: 93, type: !44)
!136 = !DILocation(line: 93, column: 19, scope: !133)
!137 = !DILocalVariable(name: "dest", scope: !133, file: !12, line: 94, type: !25)
!138 = !DILocation(line: 94, column: 14, scope: !133)
!139 = !DILocation(line: 95, column: 9, scope: !133)
!140 = !DILocation(line: 96, column: 9, scope: !133)
!141 = !DILocation(line: 96, column: 21, scope: !133)
!142 = !DILocation(line: 97, column: 26, scope: !133)
!143 = !DILocation(line: 97, column: 19, scope: !133)
!144 = !DILocation(line: 97, column: 17, scope: !133)
!145 = !DILocation(line: 100, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !133, file: !12, line: 100, column: 9)
!147 = !DILocation(line: 100, column: 14, scope: !146)
!148 = !DILocation(line: 100, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !12, line: 100, column: 9)
!150 = !DILocation(line: 100, column: 25, scope: !149)
!151 = !DILocation(line: 100, column: 23, scope: !149)
!152 = !DILocation(line: 100, column: 9, scope: !146)
!153 = !DILocation(line: 102, column: 23, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !12, line: 101, column: 9)
!155 = !DILocation(line: 102, column: 28, scope: !154)
!156 = !DILocation(line: 102, column: 18, scope: !154)
!157 = !DILocation(line: 102, column: 13, scope: !154)
!158 = !DILocation(line: 102, column: 21, scope: !154)
!159 = !DILocation(line: 103, column: 9, scope: !154)
!160 = !DILocation(line: 100, column: 35, scope: !149)
!161 = !DILocation(line: 100, column: 9, scope: !149)
!162 = distinct !{!162, !152, !163, !77}
!163 = !DILocation(line: 103, column: 9, scope: !146)
!164 = !DILocation(line: 104, column: 9, scope: !133)
!165 = !DILocation(line: 104, column: 21, scope: !133)
!166 = !DILocation(line: 105, column: 19, scope: !133)
!167 = !DILocation(line: 105, column: 9, scope: !133)
!168 = !DILocation(line: 107, column: 1, scope: !110)
!169 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !107, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!170 = !DILocation(line: 32, column: 5, scope: !169)
!171 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 110, type: !13, scopeLine: 111, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!172 = !DILocalVariable(name: "data", scope: !171, file: !12, line: 112, type: !16)
!173 = !DILocation(line: 112, column: 12, scope: !171)
!174 = !DILocalVariable(name: "dataBadBuffer", scope: !171, file: !12, line: 113, type: !20)
!175 = !DILocation(line: 113, column: 10, scope: !171)
!176 = !DILocalVariable(name: "dataGoodBuffer", scope: !171, file: !12, line: 114, type: !25)
!177 = !DILocation(line: 114, column: 10, scope: !171)
!178 = !DILocation(line: 115, column: 5, scope: !171)
!179 = !DILocation(line: 116, column: 5, scope: !171)
!180 = !DILocation(line: 116, column: 25, scope: !171)
!181 = !DILocation(line: 117, column: 5, scope: !171)
!182 = !DILocation(line: 118, column: 5, scope: !171)
!183 = !DILocation(line: 118, column: 27, scope: !171)
!184 = !DILocation(line: 119, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !171, file: !12, line: 119, column: 8)
!186 = !DILocation(line: 119, column: 8, scope: !171)
!187 = !DILocation(line: 122, column: 16, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !12, line: 120, column: 5)
!189 = !DILocation(line: 122, column: 14, scope: !188)
!190 = !DILocation(line: 123, column: 5, scope: !188)
!191 = !DILocalVariable(name: "i", scope: !192, file: !12, line: 125, type: !44)
!192 = distinct !DILexicalBlock(scope: !171, file: !12, line: 124, column: 5)
!193 = !DILocation(line: 125, column: 16, scope: !192)
!194 = !DILocalVariable(name: "destLen", scope: !192, file: !12, line: 125, type: !44)
!195 = !DILocation(line: 125, column: 19, scope: !192)
!196 = !DILocalVariable(name: "dest", scope: !192, file: !12, line: 126, type: !25)
!197 = !DILocation(line: 126, column: 14, scope: !192)
!198 = !DILocation(line: 127, column: 9, scope: !192)
!199 = !DILocation(line: 128, column: 9, scope: !192)
!200 = !DILocation(line: 128, column: 21, scope: !192)
!201 = !DILocation(line: 129, column: 26, scope: !192)
!202 = !DILocation(line: 129, column: 19, scope: !192)
!203 = !DILocation(line: 129, column: 17, scope: !192)
!204 = !DILocation(line: 132, column: 16, scope: !205)
!205 = distinct !DILexicalBlock(scope: !192, file: !12, line: 132, column: 9)
!206 = !DILocation(line: 132, column: 14, scope: !205)
!207 = !DILocation(line: 132, column: 21, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !12, line: 132, column: 9)
!209 = !DILocation(line: 132, column: 25, scope: !208)
!210 = !DILocation(line: 132, column: 23, scope: !208)
!211 = !DILocation(line: 132, column: 9, scope: !205)
!212 = !DILocation(line: 134, column: 23, scope: !213)
!213 = distinct !DILexicalBlock(scope: !208, file: !12, line: 133, column: 9)
!214 = !DILocation(line: 134, column: 28, scope: !213)
!215 = !DILocation(line: 134, column: 18, scope: !213)
!216 = !DILocation(line: 134, column: 13, scope: !213)
!217 = !DILocation(line: 134, column: 21, scope: !213)
!218 = !DILocation(line: 135, column: 9, scope: !213)
!219 = !DILocation(line: 132, column: 35, scope: !208)
!220 = !DILocation(line: 132, column: 9, scope: !208)
!221 = distinct !{!221, !211, !222, !77}
!222 = !DILocation(line: 135, column: 9, scope: !205)
!223 = !DILocation(line: 136, column: 9, scope: !192)
!224 = !DILocation(line: 136, column: 21, scope: !192)
!225 = !DILocation(line: 137, column: 19, scope: !192)
!226 = !DILocation(line: 137, column: 9, scope: !192)
!227 = !DILocation(line: 139, column: 1, scope: !171)
