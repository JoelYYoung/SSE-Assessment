; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_badSink(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !30, metadata !DIExpression()), !dbg !31
  %1 = load i8*, i8** %data.addr, align 8, !dbg !32
  %call = call i64 @strlen(i8* %1) #6, !dbg !33
  store i64 %call, i64* %dataLen, align 8, !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !38
  %3 = load i64, i64* %dataLen, align 8, !dbg !40
  %cmp = icmp ult i64 %2, %3, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !43
  %5 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !43
  %6 = load i8, i8* %arrayidx, align 1, !dbg !43
  %7 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !47
  store i8 %6, i8* %arrayidx1, align 1, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %8, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !55
  store i8 0, i8* %arrayidx2, align 1, !dbg !56
  %9 = load i8*, i8** %data.addr, align 8, !dbg !57
  call void @printLine(i8* %9), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_bad() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = alloca i8, i64 100, align 16, !dbg !67
  store i8* %0, i8** %dataBuffer, align 8, !dbg !66
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !68
  store i8* %1, i8** %data, align 8, !dbg !69
  %2 = load i8*, i8** %data, align 8, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !71
  %3 = load i8*, i8** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %4 = load i8*, i8** %data, align 8, !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_badSink(i8* %4), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_goodG2BSink(i8* %data) #0 !dbg !77 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !80, metadata !DIExpression()), !dbg !82
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !82
  call void @llvm.dbg.declare(metadata i64* %i, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !85, metadata !DIExpression()), !dbg !86
  %1 = load i8*, i8** %data.addr, align 8, !dbg !87
  %call = call i64 @strlen(i8* %1) #6, !dbg !88
  store i64 %call, i64* %dataLen, align 8, !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !93
  %3 = load i64, i64* %dataLen, align 8, !dbg !95
  %cmp = icmp ult i64 %2, %3, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !98
  %5 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !98
  %6 = load i8, i8* %arrayidx, align 1, !dbg !98
  %7 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !102
  store i8 %6, i8* %arrayidx1, align 1, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !105
  %inc = add i64 %8, 1, !dbg !105
  store i64 %inc, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !109
  store i8 0, i8* %arrayidx2, align 1, !dbg !110
  %9 = load i8*, i8** %data.addr, align 8, !dbg !111
  call void @printLine(i8* %9), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_good() #0 !dbg !114 {
entry:
  call void @goodG2B(), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !117 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !122, metadata !DIExpression()), !dbg !123
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !124, metadata !DIExpression()), !dbg !125
  %call = call i64 @time(i64* null) #7, !dbg !126
  %conv = trunc i64 %call to i32, !dbg !127
  call void @srand(i32 %conv) #7, !dbg !128
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !129
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_good(), !dbg !130
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !132
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_bad(), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !134
  ret i32 0, !dbg !135
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !136 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  %0 = alloca i8, i64 100, align 16, !dbg !141
  store i8* %0, i8** %dataBuffer, align 8, !dbg !140
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !142
  store i8* %1, i8** %data, align 8, !dbg !143
  %2 = load i8*, i8** %data, align 8, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !145
  %3 = load i8*, i8** %data, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  %4 = load i8*, i8** %data, align 8, !dbg !148
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_goodG2BSink(i8* %4), !dbg !149
  ret void, !dbg !150
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 84, scope: !13)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !14, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 14, scope: !20)
!25 = !DILocalVariable(name: "i", scope: !20, file: !14, line: 27, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 46, baseType: !28)
!27 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 27, column: 16, scope: !20)
!30 = !DILocalVariable(name: "dataLen", scope: !20, file: !14, line: 27, type: !26)
!31 = !DILocation(line: 27, column: 19, scope: !20)
!32 = !DILocation(line: 28, column: 26, scope: !20)
!33 = !DILocation(line: 28, column: 19, scope: !20)
!34 = !DILocation(line: 28, column: 17, scope: !20)
!35 = !DILocation(line: 30, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !20, file: !14, line: 30, column: 9)
!37 = !DILocation(line: 30, column: 14, scope: !36)
!38 = !DILocation(line: 30, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !14, line: 30, column: 9)
!40 = !DILocation(line: 30, column: 25, scope: !39)
!41 = !DILocation(line: 30, column: 23, scope: !39)
!42 = !DILocation(line: 30, column: 9, scope: !36)
!43 = !DILocation(line: 32, column: 23, scope: !44)
!44 = distinct !DILexicalBlock(scope: !39, file: !14, line: 31, column: 9)
!45 = !DILocation(line: 32, column: 28, scope: !44)
!46 = !DILocation(line: 32, column: 18, scope: !44)
!47 = !DILocation(line: 32, column: 13, scope: !44)
!48 = !DILocation(line: 32, column: 21, scope: !44)
!49 = !DILocation(line: 33, column: 9, scope: !44)
!50 = !DILocation(line: 30, column: 35, scope: !39)
!51 = !DILocation(line: 30, column: 9, scope: !39)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 33, column: 9, scope: !36)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 34, column: 9, scope: !20)
!56 = !DILocation(line: 34, column: 20, scope: !20)
!57 = !DILocation(line: 35, column: 19, scope: !20)
!58 = !DILocation(line: 35, column: 9, scope: !20)
!59 = !DILocation(line: 37, column: 1, scope: !13)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_bad", scope: !14, file: !14, line: 39, type: !61, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{null}
!63 = !DILocalVariable(name: "data", scope: !60, file: !14, line: 41, type: !4)
!64 = !DILocation(line: 41, column: 12, scope: !60)
!65 = !DILocalVariable(name: "dataBuffer", scope: !60, file: !14, line: 42, type: !4)
!66 = !DILocation(line: 42, column: 12, scope: !60)
!67 = !DILocation(line: 42, column: 33, scope: !60)
!68 = !DILocation(line: 43, column: 12, scope: !60)
!69 = !DILocation(line: 43, column: 10, scope: !60)
!70 = !DILocation(line: 45, column: 12, scope: !60)
!71 = !DILocation(line: 45, column: 5, scope: !60)
!72 = !DILocation(line: 46, column: 5, scope: !60)
!73 = !DILocation(line: 46, column: 17, scope: !60)
!74 = !DILocation(line: 47, column: 76, scope: !60)
!75 = !DILocation(line: 47, column: 5, scope: !60)
!76 = !DILocation(line: 48, column: 1, scope: !60)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_goodG2BSink", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", arg: 1, scope: !77, file: !14, line: 54, type: !4)
!79 = !DILocation(line: 54, column: 88, scope: !77)
!80 = !DILocalVariable(name: "dest", scope: !81, file: !14, line: 57, type: !21)
!81 = distinct !DILexicalBlock(scope: !77, file: !14, line: 56, column: 5)
!82 = !DILocation(line: 57, column: 14, scope: !81)
!83 = !DILocalVariable(name: "i", scope: !81, file: !14, line: 58, type: !26)
!84 = !DILocation(line: 58, column: 16, scope: !81)
!85 = !DILocalVariable(name: "dataLen", scope: !81, file: !14, line: 58, type: !26)
!86 = !DILocation(line: 58, column: 19, scope: !81)
!87 = !DILocation(line: 59, column: 26, scope: !81)
!88 = !DILocation(line: 59, column: 19, scope: !81)
!89 = !DILocation(line: 59, column: 17, scope: !81)
!90 = !DILocation(line: 61, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !81, file: !14, line: 61, column: 9)
!92 = !DILocation(line: 61, column: 14, scope: !91)
!93 = !DILocation(line: 61, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !14, line: 61, column: 9)
!95 = !DILocation(line: 61, column: 25, scope: !94)
!96 = !DILocation(line: 61, column: 23, scope: !94)
!97 = !DILocation(line: 61, column: 9, scope: !91)
!98 = !DILocation(line: 63, column: 23, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !14, line: 62, column: 9)
!100 = !DILocation(line: 63, column: 28, scope: !99)
!101 = !DILocation(line: 63, column: 18, scope: !99)
!102 = !DILocation(line: 63, column: 13, scope: !99)
!103 = !DILocation(line: 63, column: 21, scope: !99)
!104 = !DILocation(line: 64, column: 9, scope: !99)
!105 = !DILocation(line: 61, column: 35, scope: !94)
!106 = !DILocation(line: 61, column: 9, scope: !94)
!107 = distinct !{!107, !97, !108, !54}
!108 = !DILocation(line: 64, column: 9, scope: !91)
!109 = !DILocation(line: 65, column: 9, scope: !81)
!110 = !DILocation(line: 65, column: 20, scope: !81)
!111 = !DILocation(line: 66, column: 19, scope: !81)
!112 = !DILocation(line: 66, column: 9, scope: !81)
!113 = !DILocation(line: 68, column: 1, scope: !77)
!114 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_41_good", scope: !14, file: !14, line: 82, type: !61, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocation(line: 84, column: 5, scope: !114)
!116 = !DILocation(line: 85, column: 1, scope: !114)
!117 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 97, type: !118, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DISubroutineType(types: !119)
!119 = !{!120, !120, !121}
!120 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!122 = !DILocalVariable(name: "argc", arg: 1, scope: !117, file: !14, line: 97, type: !120)
!123 = !DILocation(line: 97, column: 14, scope: !117)
!124 = !DILocalVariable(name: "argv", arg: 2, scope: !117, file: !14, line: 97, type: !121)
!125 = !DILocation(line: 97, column: 27, scope: !117)
!126 = !DILocation(line: 100, column: 22, scope: !117)
!127 = !DILocation(line: 100, column: 12, scope: !117)
!128 = !DILocation(line: 100, column: 5, scope: !117)
!129 = !DILocation(line: 102, column: 5, scope: !117)
!130 = !DILocation(line: 103, column: 5, scope: !117)
!131 = !DILocation(line: 104, column: 5, scope: !117)
!132 = !DILocation(line: 107, column: 5, scope: !117)
!133 = !DILocation(line: 108, column: 5, scope: !117)
!134 = !DILocation(line: 109, column: 5, scope: !117)
!135 = !DILocation(line: 111, column: 5, scope: !117)
!136 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 71, type: !61, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !14, line: 73, type: !4)
!138 = !DILocation(line: 73, column: 12, scope: !136)
!139 = !DILocalVariable(name: "dataBuffer", scope: !136, file: !14, line: 74, type: !4)
!140 = !DILocation(line: 74, column: 12, scope: !136)
!141 = !DILocation(line: 74, column: 33, scope: !136)
!142 = !DILocation(line: 75, column: 12, scope: !136)
!143 = !DILocation(line: 75, column: 10, scope: !136)
!144 = !DILocation(line: 77, column: 12, scope: !136)
!145 = !DILocation(line: 77, column: 5, scope: !136)
!146 = !DILocation(line: 78, column: 5, scope: !136)
!147 = !DILocation(line: 78, column: 16, scope: !136)
!148 = !DILocation(line: 79, column: 80, scope: !136)
!149 = !DILocation(line: 79, column: 5, scope: !136)
!150 = !DILocation(line: 80, column: 1, scope: !136)
