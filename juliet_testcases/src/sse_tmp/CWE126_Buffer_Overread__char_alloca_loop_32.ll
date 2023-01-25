; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !31
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !35
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !38, metadata !DIExpression()), !dbg !40
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  %7 = load i8*, i8** %6, align 8, !dbg !42
  store i8* %7, i8** %data2, align 8, !dbg !40
  %8 = load i8*, i8** %dataBadBuffer, align 8, !dbg !43
  store i8* %8, i8** %data2, align 8, !dbg !44
  %9 = load i8*, i8** %data2, align 8, !dbg !45
  %10 = load i8**, i8*** %dataPtr1, align 8, !dbg !46
  store i8* %9, i8** %10, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !48, metadata !DIExpression()), !dbg !50
  %11 = load i8**, i8*** %dataPtr2, align 8, !dbg !51
  %12 = load i8*, i8** %11, align 8, !dbg !52
  store i8* %12, i8** %data3, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !53, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !61, metadata !DIExpression()), !dbg !65
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !66
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !66
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !67
  store i8 0, i8* %arrayidx4, align 1, !dbg !68
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !69
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !70
  store i64 %call, i64* %destLen, align 8, !dbg !71
  store i64 0, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i64, i64* %i, align 8, !dbg !75
  %14 = load i64, i64* %destLen, align 8, !dbg !77
  %cmp = icmp ult i64 %13, %14, !dbg !78
  br i1 %cmp, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %15 = load i8*, i8** %data3, align 8, !dbg !80
  %16 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx6 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !80
  %17 = load i8, i8* %arrayidx6, align 1, !dbg !80
  %18 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %18, !dbg !84
  store i8 %17, i8* %arrayidx7, align 1, !dbg !85
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !87
  %inc = add i64 %19, 1, !dbg !87
  store i64 %inc, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !92
  store i8 0, i8* %arrayidx8, align 1, !dbg !93
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !94
  call void @printLine(i8* %arraydecay9), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_32_good() #0 !dbg !97 {
entry:
  call void @goodG2B(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i64 @time(i64* null) #7, !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 %conv) #7, !dbg !110
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !111
  call void @CWE126_Buffer_Overread__char_alloca_loop_32_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @CWE126_Buffer_Overread__char_alloca_loop_32_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !118 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !121, metadata !DIExpression()), !dbg !122
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !123, metadata !DIExpression()), !dbg !124
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = alloca i8, i64 50, align 16, !dbg !127
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %1 = alloca i8, i64 100, align 16, !dbg !130
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !129
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !132
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !133
  store i8 0, i8* %arrayidx, align 1, !dbg !134
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !136
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !137
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !137
  store i8 0, i8* %arrayidx1, align 1, !dbg !138
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !139, metadata !DIExpression()), !dbg !141
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !142
  %7 = load i8*, i8** %6, align 8, !dbg !143
  store i8* %7, i8** %data2, align 8, !dbg !141
  %8 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !144
  store i8* %8, i8** %data2, align 8, !dbg !145
  %9 = load i8*, i8** %data2, align 8, !dbg !146
  %10 = load i8**, i8*** %dataPtr1, align 8, !dbg !147
  store i8* %9, i8** %10, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !149, metadata !DIExpression()), !dbg !151
  %11 = load i8**, i8*** %dataPtr2, align 8, !dbg !152
  %12 = load i8*, i8** %11, align 8, !dbg !153
  store i8* %12, i8** %data3, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata i64* %i, metadata !154, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !159, metadata !DIExpression()), !dbg !160
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !161
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !162
  store i8 0, i8* %arrayidx4, align 1, !dbg !163
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !164
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !165
  store i64 %call, i64* %destLen, align 8, !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i64, i64* %i, align 8, !dbg !170
  %14 = load i64, i64* %destLen, align 8, !dbg !172
  %cmp = icmp ult i64 %13, %14, !dbg !173
  br i1 %cmp, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %15 = load i8*, i8** %data3, align 8, !dbg !175
  %16 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx6 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !175
  %17 = load i8, i8* %arrayidx6, align 1, !dbg !175
  %18 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %18, !dbg !179
  store i8 %17, i8* %arrayidx7, align 1, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !182
  %inc = add i64 %19, 1, !dbg !182
  store i64 %inc, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !186
  store i8 0, i8* %arrayidx8, align 1, !dbg !187
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !188
  call void @printLine(i8* %arraydecay9), !dbg !189
  ret void, !dbg !190
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 28, type: !4)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 29, type: !4)
!28 = !DILocation(line: 29, column: 12, scope: !13)
!29 = !DILocation(line: 29, column: 37, scope: !13)
!30 = !DILocation(line: 30, column: 12, scope: !13)
!31 = !DILocation(line: 30, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 5, scope: !13)
!33 = !DILocation(line: 31, column: 25, scope: !13)
!34 = !DILocation(line: 32, column: 12, scope: !13)
!35 = !DILocation(line: 32, column: 5, scope: !13)
!36 = !DILocation(line: 33, column: 5, scope: !13)
!37 = !DILocation(line: 33, column: 27, scope: !13)
!38 = !DILocalVariable(name: "data", scope: !39, file: !14, line: 35, type: !4)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!40 = !DILocation(line: 35, column: 16, scope: !39)
!41 = !DILocation(line: 35, column: 24, scope: !39)
!42 = !DILocation(line: 35, column: 23, scope: !39)
!43 = !DILocation(line: 37, column: 16, scope: !39)
!44 = !DILocation(line: 37, column: 14, scope: !39)
!45 = !DILocation(line: 38, column: 21, scope: !39)
!46 = !DILocation(line: 38, column: 10, scope: !39)
!47 = !DILocation(line: 38, column: 19, scope: !39)
!48 = !DILocalVariable(name: "data", scope: !49, file: !14, line: 41, type: !4)
!49 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!50 = !DILocation(line: 41, column: 16, scope: !49)
!51 = !DILocation(line: 41, column: 24, scope: !49)
!52 = !DILocation(line: 41, column: 23, scope: !49)
!53 = !DILocalVariable(name: "i", scope: !54, file: !14, line: 43, type: !55)
!54 = distinct !DILexicalBlock(scope: !49, file: !14, line: 42, column: 9)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !56, line: 46, baseType: !57)
!56 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 43, column: 20, scope: !54)
!59 = !DILocalVariable(name: "destLen", scope: !54, file: !14, line: 43, type: !55)
!60 = !DILocation(line: 43, column: 23, scope: !54)
!61 = !DILocalVariable(name: "dest", scope: !54, file: !14, line: 44, type: !62)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 100)
!65 = !DILocation(line: 44, column: 18, scope: !54)
!66 = !DILocation(line: 45, column: 13, scope: !54)
!67 = !DILocation(line: 46, column: 13, scope: !54)
!68 = !DILocation(line: 46, column: 25, scope: !54)
!69 = !DILocation(line: 47, column: 30, scope: !54)
!70 = !DILocation(line: 47, column: 23, scope: !54)
!71 = !DILocation(line: 47, column: 21, scope: !54)
!72 = !DILocation(line: 50, column: 20, scope: !73)
!73 = distinct !DILexicalBlock(scope: !54, file: !14, line: 50, column: 13)
!74 = !DILocation(line: 50, column: 18, scope: !73)
!75 = !DILocation(line: 50, column: 25, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !14, line: 50, column: 13)
!77 = !DILocation(line: 50, column: 29, scope: !76)
!78 = !DILocation(line: 50, column: 27, scope: !76)
!79 = !DILocation(line: 50, column: 13, scope: !73)
!80 = !DILocation(line: 52, column: 27, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !14, line: 51, column: 13)
!82 = !DILocation(line: 52, column: 32, scope: !81)
!83 = !DILocation(line: 52, column: 22, scope: !81)
!84 = !DILocation(line: 52, column: 17, scope: !81)
!85 = !DILocation(line: 52, column: 25, scope: !81)
!86 = !DILocation(line: 53, column: 13, scope: !81)
!87 = !DILocation(line: 50, column: 39, scope: !76)
!88 = !DILocation(line: 50, column: 13, scope: !76)
!89 = distinct !{!89, !79, !90, !91}
!90 = !DILocation(line: 53, column: 13, scope: !73)
!91 = !{!"llvm.loop.mustprogress"}
!92 = !DILocation(line: 54, column: 13, scope: !54)
!93 = !DILocation(line: 54, column: 25, scope: !54)
!94 = !DILocation(line: 55, column: 23, scope: !54)
!95 = !DILocation(line: 55, column: 13, scope: !54)
!96 = !DILocation(line: 58, column: 1, scope: !13)
!97 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_32_good", scope: !14, file: !14, line: 102, type: !15, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 104, column: 5, scope: !97)
!99 = !DILocation(line: 105, column: 1, scope: !97)
!100 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 116, type: !101, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !103, !20}
!103 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !14, line: 116, type: !103)
!105 = !DILocation(line: 116, column: 14, scope: !100)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !14, line: 116, type: !20)
!107 = !DILocation(line: 116, column: 27, scope: !100)
!108 = !DILocation(line: 119, column: 22, scope: !100)
!109 = !DILocation(line: 119, column: 12, scope: !100)
!110 = !DILocation(line: 119, column: 5, scope: !100)
!111 = !DILocation(line: 121, column: 5, scope: !100)
!112 = !DILocation(line: 122, column: 5, scope: !100)
!113 = !DILocation(line: 123, column: 5, scope: !100)
!114 = !DILocation(line: 126, column: 5, scope: !100)
!115 = !DILocation(line: 127, column: 5, scope: !100)
!116 = !DILocation(line: 128, column: 5, scope: !100)
!117 = !DILocation(line: 130, column: 5, scope: !100)
!118 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !14, line: 67, type: !4)
!120 = !DILocation(line: 67, column: 12, scope: !118)
!121 = !DILocalVariable(name: "dataPtr1", scope: !118, file: !14, line: 68, type: !20)
!122 = !DILocation(line: 68, column: 13, scope: !118)
!123 = !DILocalVariable(name: "dataPtr2", scope: !118, file: !14, line: 69, type: !20)
!124 = !DILocation(line: 69, column: 13, scope: !118)
!125 = !DILocalVariable(name: "dataBadBuffer", scope: !118, file: !14, line: 70, type: !4)
!126 = !DILocation(line: 70, column: 12, scope: !118)
!127 = !DILocation(line: 70, column: 36, scope: !118)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !118, file: !14, line: 71, type: !4)
!129 = !DILocation(line: 71, column: 12, scope: !118)
!130 = !DILocation(line: 71, column: 37, scope: !118)
!131 = !DILocation(line: 72, column: 12, scope: !118)
!132 = !DILocation(line: 72, column: 5, scope: !118)
!133 = !DILocation(line: 73, column: 5, scope: !118)
!134 = !DILocation(line: 73, column: 25, scope: !118)
!135 = !DILocation(line: 74, column: 12, scope: !118)
!136 = !DILocation(line: 74, column: 5, scope: !118)
!137 = !DILocation(line: 75, column: 5, scope: !118)
!138 = !DILocation(line: 75, column: 27, scope: !118)
!139 = !DILocalVariable(name: "data", scope: !140, file: !14, line: 77, type: !4)
!140 = distinct !DILexicalBlock(scope: !118, file: !14, line: 76, column: 5)
!141 = !DILocation(line: 77, column: 16, scope: !140)
!142 = !DILocation(line: 77, column: 24, scope: !140)
!143 = !DILocation(line: 77, column: 23, scope: !140)
!144 = !DILocation(line: 79, column: 16, scope: !140)
!145 = !DILocation(line: 79, column: 14, scope: !140)
!146 = !DILocation(line: 80, column: 21, scope: !140)
!147 = !DILocation(line: 80, column: 10, scope: !140)
!148 = !DILocation(line: 80, column: 19, scope: !140)
!149 = !DILocalVariable(name: "data", scope: !150, file: !14, line: 83, type: !4)
!150 = distinct !DILexicalBlock(scope: !118, file: !14, line: 82, column: 5)
!151 = !DILocation(line: 83, column: 16, scope: !150)
!152 = !DILocation(line: 83, column: 24, scope: !150)
!153 = !DILocation(line: 83, column: 23, scope: !150)
!154 = !DILocalVariable(name: "i", scope: !155, file: !14, line: 85, type: !55)
!155 = distinct !DILexicalBlock(scope: !150, file: !14, line: 84, column: 9)
!156 = !DILocation(line: 85, column: 20, scope: !155)
!157 = !DILocalVariable(name: "destLen", scope: !155, file: !14, line: 85, type: !55)
!158 = !DILocation(line: 85, column: 23, scope: !155)
!159 = !DILocalVariable(name: "dest", scope: !155, file: !14, line: 86, type: !62)
!160 = !DILocation(line: 86, column: 18, scope: !155)
!161 = !DILocation(line: 87, column: 13, scope: !155)
!162 = !DILocation(line: 88, column: 13, scope: !155)
!163 = !DILocation(line: 88, column: 25, scope: !155)
!164 = !DILocation(line: 89, column: 30, scope: !155)
!165 = !DILocation(line: 89, column: 23, scope: !155)
!166 = !DILocation(line: 89, column: 21, scope: !155)
!167 = !DILocation(line: 92, column: 20, scope: !168)
!168 = distinct !DILexicalBlock(scope: !155, file: !14, line: 92, column: 13)
!169 = !DILocation(line: 92, column: 18, scope: !168)
!170 = !DILocation(line: 92, column: 25, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !14, line: 92, column: 13)
!172 = !DILocation(line: 92, column: 29, scope: !171)
!173 = !DILocation(line: 92, column: 27, scope: !171)
!174 = !DILocation(line: 92, column: 13, scope: !168)
!175 = !DILocation(line: 94, column: 27, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !14, line: 93, column: 13)
!177 = !DILocation(line: 94, column: 32, scope: !176)
!178 = !DILocation(line: 94, column: 22, scope: !176)
!179 = !DILocation(line: 94, column: 17, scope: !176)
!180 = !DILocation(line: 94, column: 25, scope: !176)
!181 = !DILocation(line: 95, column: 13, scope: !176)
!182 = !DILocation(line: 92, column: 39, scope: !171)
!183 = !DILocation(line: 92, column: 13, scope: !171)
!184 = distinct !{!184, !174, !185, !91}
!185 = !DILocation(line: 95, column: 13, scope: !168)
!186 = !DILocation(line: 96, column: 13, scope: !155)
!187 = !DILocation(line: 96, column: 25, scope: !155)
!188 = !DILocation(line: 97, column: 23, scope: !155)
!189 = !DILocation(line: 97, column: 13, scope: !155)
!190 = !DILocation(line: 100, column: 1, scope: !118)
