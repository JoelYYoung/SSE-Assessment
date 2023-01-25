; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_02.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_02_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %6, i8** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !45, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx2, align 1, !dbg !52
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !54
  store i64 %call, i64* %destLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !59
  %8 = load i64, i64* %destLen, align 8, !dbg !61
  %cmp = icmp ult i64 %7, %8, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !64
  %10 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !64
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !64
  %12 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !68
  store i8 %11, i8* %arrayidx5, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %13, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !76
  store i8 0, i8* %arrayidx6, align 1, !dbg !77
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !78
  call void @printLine(i8* %arraydecay7), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_02_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #7, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #7, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE126_Buffer_Overread__char_alloca_loop_02_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__char_alloca_loop_02_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 50, align 16, !dbg !109
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %1 = alloca i8, i64 100, align 16, !dbg !112
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !111
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !114
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !118
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !119
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !119
  store i8 0, i8* %arrayidx1, align 1, !dbg !120
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !121
  store i8* %6, i8** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !132
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !133
  store i8 0, i8* %arrayidx2, align 1, !dbg !134
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !135
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !136
  store i64 %call, i64* %destLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !141
  %8 = load i64, i64* %destLen, align 8, !dbg !143
  %cmp = icmp ult i64 %7, %8, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !146
  %10 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !146
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !146
  %12 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !150
  store i8 %11, i8* %arrayidx5, align 1, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %13, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !157
  store i8 0, i8* %arrayidx6, align 1, !dbg !158
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !159
  call void @printLine(i8* %arraydecay7), !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !162 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !165, metadata !DIExpression()), !dbg !166
  %0 = alloca i8, i64 50, align 16, !dbg !167
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !166
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !168, metadata !DIExpression()), !dbg !169
  %1 = alloca i8, i64 100, align 16, !dbg !170
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !169
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !171
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !172
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !173
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !173
  store i8 0, i8* %arrayidx, align 1, !dbg !174
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !176
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !177
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !177
  store i8 0, i8* %arrayidx1, align 1, !dbg !178
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !179
  store i8* %6, i8** %data, align 8, !dbg !182
  call void @llvm.dbg.declare(metadata i64* %i, metadata !183, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !186, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !188, metadata !DIExpression()), !dbg !189
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !190
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !190
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !191
  store i8 0, i8* %arrayidx2, align 1, !dbg !192
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !193
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !194
  store i64 %call, i64* %destLen, align 8, !dbg !195
  store i64 0, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !198

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !199
  %8 = load i64, i64* %destLen, align 8, !dbg !201
  %cmp = icmp ult i64 %7, %8, !dbg !202
  br i1 %cmp, label %for.body, label %for.end, !dbg !203

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !204
  %10 = load i64, i64* %i, align 8, !dbg !206
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !204
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !204
  %12 = load i64, i64* %i, align 8, !dbg !207
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !208
  store i8 %11, i8* %arrayidx5, align 1, !dbg !209
  br label %for.inc, !dbg !210

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !211
  %inc = add i64 %13, 1, !dbg !211
  store i64 %inc, i64* %i, align 8, !dbg !211
  br label %for.cond, !dbg !212, !llvm.loop !213

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !215
  store i8 0, i8* %arrayidx6, align 1, !dbg !216
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !217
  call void @printLine(i8* %arraydecay7), !dbg !218
  ret void, !dbg !219
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_02.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_02_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_02.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 12, scope: !13)
!30 = !DILocation(line: 30, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 27, scope: !13)
!33 = !DILocation(line: 35, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !14, line: 33, column: 5)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!36 = !DILocation(line: 35, column: 14, scope: !34)
!37 = !DILocalVariable(name: "i", scope: !38, file: !14, line: 38, type: !39)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 38, column: 16, scope: !38)
!43 = !DILocalVariable(name: "destLen", scope: !38, file: !14, line: 38, type: !39)
!44 = !DILocation(line: 38, column: 19, scope: !38)
!45 = !DILocalVariable(name: "dest", scope: !38, file: !14, line: 39, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 39, column: 14, scope: !38)
!50 = !DILocation(line: 40, column: 9, scope: !38)
!51 = !DILocation(line: 41, column: 9, scope: !38)
!52 = !DILocation(line: 41, column: 21, scope: !38)
!53 = !DILocation(line: 42, column: 26, scope: !38)
!54 = !DILocation(line: 42, column: 19, scope: !38)
!55 = !DILocation(line: 42, column: 17, scope: !38)
!56 = !DILocation(line: 45, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !38, file: !14, line: 45, column: 9)
!58 = !DILocation(line: 45, column: 14, scope: !57)
!59 = !DILocation(line: 45, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !14, line: 45, column: 9)
!61 = !DILocation(line: 45, column: 25, scope: !60)
!62 = !DILocation(line: 45, column: 23, scope: !60)
!63 = !DILocation(line: 45, column: 9, scope: !57)
!64 = !DILocation(line: 47, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !14, line: 46, column: 9)
!66 = !DILocation(line: 47, column: 28, scope: !65)
!67 = !DILocation(line: 47, column: 18, scope: !65)
!68 = !DILocation(line: 47, column: 13, scope: !65)
!69 = !DILocation(line: 47, column: 21, scope: !65)
!70 = !DILocation(line: 48, column: 9, scope: !65)
!71 = !DILocation(line: 45, column: 35, scope: !60)
!72 = !DILocation(line: 45, column: 9, scope: !60)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 48, column: 9, scope: !57)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 49, column: 9, scope: !38)
!77 = !DILocation(line: 49, column: 21, scope: !38)
!78 = !DILocation(line: 50, column: 19, scope: !38)
!79 = !DILocation(line: 50, column: 9, scope: !38)
!80 = !DILocation(line: 52, column: 1, scope: !13)
!81 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_02_good", scope: !14, file: !14, line: 127, type: !15, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 129, column: 5, scope: !81)
!83 = !DILocation(line: 130, column: 5, scope: !81)
!84 = !DILocation(line: 131, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 143, type: !86, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !14, line: 143, type: !88)
!91 = !DILocation(line: 143, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !14, line: 143, type: !89)
!93 = !DILocation(line: 143, column: 27, scope: !85)
!94 = !DILocation(line: 146, column: 22, scope: !85)
!95 = !DILocation(line: 146, column: 12, scope: !85)
!96 = !DILocation(line: 146, column: 5, scope: !85)
!97 = !DILocation(line: 148, column: 5, scope: !85)
!98 = !DILocation(line: 149, column: 5, scope: !85)
!99 = !DILocation(line: 150, column: 5, scope: !85)
!100 = !DILocation(line: 153, column: 5, scope: !85)
!101 = !DILocation(line: 154, column: 5, scope: !85)
!102 = !DILocation(line: 155, column: 5, scope: !85)
!103 = !DILocation(line: 157, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !14, line: 61, type: !4)
!106 = !DILocation(line: 61, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !14, line: 62, type: !4)
!108 = !DILocation(line: 62, column: 12, scope: !104)
!109 = !DILocation(line: 62, column: 36, scope: !104)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !14, line: 63, type: !4)
!111 = !DILocation(line: 63, column: 12, scope: !104)
!112 = !DILocation(line: 63, column: 37, scope: !104)
!113 = !DILocation(line: 64, column: 12, scope: !104)
!114 = !DILocation(line: 64, column: 5, scope: !104)
!115 = !DILocation(line: 65, column: 5, scope: !104)
!116 = !DILocation(line: 65, column: 25, scope: !104)
!117 = !DILocation(line: 66, column: 12, scope: !104)
!118 = !DILocation(line: 66, column: 5, scope: !104)
!119 = !DILocation(line: 67, column: 5, scope: !104)
!120 = !DILocation(line: 67, column: 27, scope: !104)
!121 = !DILocation(line: 76, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !123, file: !14, line: 74, column: 5)
!123 = distinct !DILexicalBlock(scope: !104, file: !14, line: 68, column: 8)
!124 = !DILocation(line: 76, column: 14, scope: !122)
!125 = !DILocalVariable(name: "i", scope: !126, file: !14, line: 79, type: !39)
!126 = distinct !DILexicalBlock(scope: !104, file: !14, line: 78, column: 5)
!127 = !DILocation(line: 79, column: 16, scope: !126)
!128 = !DILocalVariable(name: "destLen", scope: !126, file: !14, line: 79, type: !39)
!129 = !DILocation(line: 79, column: 19, scope: !126)
!130 = !DILocalVariable(name: "dest", scope: !126, file: !14, line: 80, type: !46)
!131 = !DILocation(line: 80, column: 14, scope: !126)
!132 = !DILocation(line: 81, column: 9, scope: !126)
!133 = !DILocation(line: 82, column: 9, scope: !126)
!134 = !DILocation(line: 82, column: 21, scope: !126)
!135 = !DILocation(line: 83, column: 26, scope: !126)
!136 = !DILocation(line: 83, column: 19, scope: !126)
!137 = !DILocation(line: 83, column: 17, scope: !126)
!138 = !DILocation(line: 86, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !126, file: !14, line: 86, column: 9)
!140 = !DILocation(line: 86, column: 14, scope: !139)
!141 = !DILocation(line: 86, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !14, line: 86, column: 9)
!143 = !DILocation(line: 86, column: 25, scope: !142)
!144 = !DILocation(line: 86, column: 23, scope: !142)
!145 = !DILocation(line: 86, column: 9, scope: !139)
!146 = !DILocation(line: 88, column: 23, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !14, line: 87, column: 9)
!148 = !DILocation(line: 88, column: 28, scope: !147)
!149 = !DILocation(line: 88, column: 18, scope: !147)
!150 = !DILocation(line: 88, column: 13, scope: !147)
!151 = !DILocation(line: 88, column: 21, scope: !147)
!152 = !DILocation(line: 89, column: 9, scope: !147)
!153 = !DILocation(line: 86, column: 35, scope: !142)
!154 = !DILocation(line: 86, column: 9, scope: !142)
!155 = distinct !{!155, !145, !156, !75}
!156 = !DILocation(line: 89, column: 9, scope: !139)
!157 = !DILocation(line: 90, column: 9, scope: !126)
!158 = !DILocation(line: 90, column: 21, scope: !126)
!159 = !DILocation(line: 91, column: 19, scope: !126)
!160 = !DILocation(line: 91, column: 9, scope: !126)
!161 = !DILocation(line: 93, column: 1, scope: !104)
!162 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 96, type: !15, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!163 = !DILocalVariable(name: "data", scope: !162, file: !14, line: 98, type: !4)
!164 = !DILocation(line: 98, column: 12, scope: !162)
!165 = !DILocalVariable(name: "dataBadBuffer", scope: !162, file: !14, line: 99, type: !4)
!166 = !DILocation(line: 99, column: 12, scope: !162)
!167 = !DILocation(line: 99, column: 36, scope: !162)
!168 = !DILocalVariable(name: "dataGoodBuffer", scope: !162, file: !14, line: 100, type: !4)
!169 = !DILocation(line: 100, column: 12, scope: !162)
!170 = !DILocation(line: 100, column: 37, scope: !162)
!171 = !DILocation(line: 101, column: 12, scope: !162)
!172 = !DILocation(line: 101, column: 5, scope: !162)
!173 = !DILocation(line: 102, column: 5, scope: !162)
!174 = !DILocation(line: 102, column: 25, scope: !162)
!175 = !DILocation(line: 103, column: 12, scope: !162)
!176 = !DILocation(line: 103, column: 5, scope: !162)
!177 = !DILocation(line: 104, column: 5, scope: !162)
!178 = !DILocation(line: 104, column: 27, scope: !162)
!179 = !DILocation(line: 108, column: 16, scope: !180)
!180 = distinct !DILexicalBlock(scope: !181, file: !14, line: 106, column: 5)
!181 = distinct !DILexicalBlock(scope: !162, file: !14, line: 105, column: 8)
!182 = !DILocation(line: 108, column: 14, scope: !180)
!183 = !DILocalVariable(name: "i", scope: !184, file: !14, line: 111, type: !39)
!184 = distinct !DILexicalBlock(scope: !162, file: !14, line: 110, column: 5)
!185 = !DILocation(line: 111, column: 16, scope: !184)
!186 = !DILocalVariable(name: "destLen", scope: !184, file: !14, line: 111, type: !39)
!187 = !DILocation(line: 111, column: 19, scope: !184)
!188 = !DILocalVariable(name: "dest", scope: !184, file: !14, line: 112, type: !46)
!189 = !DILocation(line: 112, column: 14, scope: !184)
!190 = !DILocation(line: 113, column: 9, scope: !184)
!191 = !DILocation(line: 114, column: 9, scope: !184)
!192 = !DILocation(line: 114, column: 21, scope: !184)
!193 = !DILocation(line: 115, column: 26, scope: !184)
!194 = !DILocation(line: 115, column: 19, scope: !184)
!195 = !DILocation(line: 115, column: 17, scope: !184)
!196 = !DILocation(line: 118, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !184, file: !14, line: 118, column: 9)
!198 = !DILocation(line: 118, column: 14, scope: !197)
!199 = !DILocation(line: 118, column: 21, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !14, line: 118, column: 9)
!201 = !DILocation(line: 118, column: 25, scope: !200)
!202 = !DILocation(line: 118, column: 23, scope: !200)
!203 = !DILocation(line: 118, column: 9, scope: !197)
!204 = !DILocation(line: 120, column: 23, scope: !205)
!205 = distinct !DILexicalBlock(scope: !200, file: !14, line: 119, column: 9)
!206 = !DILocation(line: 120, column: 28, scope: !205)
!207 = !DILocation(line: 120, column: 18, scope: !205)
!208 = !DILocation(line: 120, column: 13, scope: !205)
!209 = !DILocation(line: 120, column: 21, scope: !205)
!210 = !DILocation(line: 121, column: 9, scope: !205)
!211 = !DILocation(line: 118, column: 35, scope: !200)
!212 = !DILocation(line: 118, column: 9, scope: !200)
!213 = distinct !{!213, !203, !214, !75}
!214 = !DILocation(line: 121, column: 9, scope: !197)
!215 = !DILocation(line: 122, column: 9, scope: !184)
!216 = !DILocation(line: 122, column: 21, scope: !184)
!217 = !DILocation(line: 123, column: 19, scope: !184)
!218 = !DILocation(line: 123, column: 9, scope: !184)
!219 = !DILocation(line: 125, column: 1, scope: !162)
