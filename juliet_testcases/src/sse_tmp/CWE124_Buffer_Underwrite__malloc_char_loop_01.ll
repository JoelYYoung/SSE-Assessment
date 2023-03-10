; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_01.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !24
  store i8* %call, i8** %dataBuffer, align 8, !dbg !23
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !36
  store i8* %add.ptr, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx1, align 1, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !55
  %cmp2 = icmp ult i64 %4, 100, !dbg !57
  br i1 %cmp2, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !61
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !61
  %7 = load i8*, i8** %data, align 8, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !62
  store i8 %6, i8* %arrayidx4, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %9, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !71
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !71
  store i8 0, i8* %arrayidx5, align 1, !dbg !72
  %11 = load i8*, i8** %data, align 8, !dbg !73
  call void @printLine(i8* %11), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_01_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #6, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #6, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_01_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_01_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i8* null, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !104
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !105
  store i8* %call, i8** %dataBuffer, align 8, !dbg !104
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  %cmp = icmp eq i8* %0, null, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !113
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  store i8* %3, i8** %data, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !123
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx1, align 1, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !129
  %cmp2 = icmp ult i64 %4, 100, !dbg !131
  br i1 %cmp2, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !135
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !135
  %7 = load i8*, i8** %data, align 8, !dbg !136
  %8 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !136
  store i8 %6, i8* %arrayidx4, align 1, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %9, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !144
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !144
  store i8 0, i8* %arrayidx5, align 1, !dbg !145
  %11 = load i8*, i8** %data, align 8, !dbg !146
  call void @printLine(i8* %11), !dbg !147
  ret void, !dbg !148
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_01_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 28, type: !4)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 5)
!23 = !DILocation(line: 28, column: 16, scope: !22)
!24 = !DILocation(line: 28, column: 37, scope: !22)
!25 = !DILocation(line: 29, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 29, column: 13)
!27 = !DILocation(line: 29, column: 24, scope: !26)
!28 = !DILocation(line: 29, column: 13, scope: !22)
!29 = !DILocation(line: 29, column: 34, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 33)
!31 = !DILocation(line: 30, column: 16, scope: !22)
!32 = !DILocation(line: 30, column: 9, scope: !22)
!33 = !DILocation(line: 31, column: 9, scope: !22)
!34 = !DILocation(line: 31, column: 27, scope: !22)
!35 = !DILocation(line: 33, column: 16, scope: !22)
!36 = !DILocation(line: 33, column: 27, scope: !22)
!37 = !DILocation(line: 33, column: 14, scope: !22)
!38 = !DILocalVariable(name: "i", scope: !39, file: !15, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 36, column: 16, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !39, file: !15, line: 37, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 37, column: 14, scope: !39)
!49 = !DILocation(line: 38, column: 9, scope: !39)
!50 = !DILocation(line: 39, column: 9, scope: !39)
!51 = !DILocation(line: 39, column: 23, scope: !39)
!52 = !DILocation(line: 41, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !39, file: !15, line: 41, column: 9)
!54 = !DILocation(line: 41, column: 14, scope: !53)
!55 = !DILocation(line: 41, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !15, line: 41, column: 9)
!57 = !DILocation(line: 41, column: 23, scope: !56)
!58 = !DILocation(line: 41, column: 9, scope: !53)
!59 = !DILocation(line: 43, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !15, line: 42, column: 9)
!61 = !DILocation(line: 43, column: 23, scope: !60)
!62 = !DILocation(line: 43, column: 13, scope: !60)
!63 = !DILocation(line: 43, column: 18, scope: !60)
!64 = !DILocation(line: 43, column: 21, scope: !60)
!65 = !DILocation(line: 44, column: 9, scope: !60)
!66 = !DILocation(line: 41, column: 31, scope: !56)
!67 = !DILocation(line: 41, column: 9, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 44, column: 9, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 46, column: 9, scope: !39)
!72 = !DILocation(line: 46, column: 21, scope: !39)
!73 = !DILocation(line: 47, column: 19, scope: !39)
!74 = !DILocation(line: 47, column: 9, scope: !39)
!75 = !DILocation(line: 51, column: 1, scope: !14)
!76 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_01_good", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 90, column: 5, scope: !76)
!78 = !DILocation(line: 91, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 103, type: !80, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !15, line: 103, type: !82)
!85 = !DILocation(line: 103, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !15, line: 103, type: !83)
!87 = !DILocation(line: 103, column: 27, scope: !79)
!88 = !DILocation(line: 106, column: 22, scope: !79)
!89 = !DILocation(line: 106, column: 12, scope: !79)
!90 = !DILocation(line: 106, column: 5, scope: !79)
!91 = !DILocation(line: 108, column: 5, scope: !79)
!92 = !DILocation(line: 109, column: 5, scope: !79)
!93 = !DILocation(line: 110, column: 5, scope: !79)
!94 = !DILocation(line: 113, column: 5, scope: !79)
!95 = !DILocation(line: 114, column: 5, scope: !79)
!96 = !DILocation(line: 115, column: 5, scope: !79)
!97 = !DILocation(line: 117, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !15, line: 60, type: !4)
!100 = !DILocation(line: 60, column: 12, scope: !98)
!101 = !DILocation(line: 61, column: 10, scope: !98)
!102 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !15, line: 63, type: !4)
!103 = distinct !DILexicalBlock(scope: !98, file: !15, line: 62, column: 5)
!104 = !DILocation(line: 63, column: 16, scope: !103)
!105 = !DILocation(line: 63, column: 37, scope: !103)
!106 = !DILocation(line: 64, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 64, column: 13)
!108 = !DILocation(line: 64, column: 24, scope: !107)
!109 = !DILocation(line: 64, column: 13, scope: !103)
!110 = !DILocation(line: 64, column: 34, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !15, line: 64, column: 33)
!112 = !DILocation(line: 65, column: 16, scope: !103)
!113 = !DILocation(line: 65, column: 9, scope: !103)
!114 = !DILocation(line: 66, column: 9, scope: !103)
!115 = !DILocation(line: 66, column: 27, scope: !103)
!116 = !DILocation(line: 68, column: 16, scope: !103)
!117 = !DILocation(line: 68, column: 14, scope: !103)
!118 = !DILocalVariable(name: "i", scope: !119, file: !15, line: 71, type: !40)
!119 = distinct !DILexicalBlock(scope: !98, file: !15, line: 70, column: 5)
!120 = !DILocation(line: 71, column: 16, scope: !119)
!121 = !DILocalVariable(name: "source", scope: !119, file: !15, line: 72, type: !45)
!122 = !DILocation(line: 72, column: 14, scope: !119)
!123 = !DILocation(line: 73, column: 9, scope: !119)
!124 = !DILocation(line: 74, column: 9, scope: !119)
!125 = !DILocation(line: 74, column: 23, scope: !119)
!126 = !DILocation(line: 76, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !119, file: !15, line: 76, column: 9)
!128 = !DILocation(line: 76, column: 14, scope: !127)
!129 = !DILocation(line: 76, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !15, line: 76, column: 9)
!131 = !DILocation(line: 76, column: 23, scope: !130)
!132 = !DILocation(line: 76, column: 9, scope: !127)
!133 = !DILocation(line: 78, column: 30, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !15, line: 77, column: 9)
!135 = !DILocation(line: 78, column: 23, scope: !134)
!136 = !DILocation(line: 78, column: 13, scope: !134)
!137 = !DILocation(line: 78, column: 18, scope: !134)
!138 = !DILocation(line: 78, column: 21, scope: !134)
!139 = !DILocation(line: 79, column: 9, scope: !134)
!140 = !DILocation(line: 76, column: 31, scope: !130)
!141 = !DILocation(line: 76, column: 9, scope: !130)
!142 = distinct !{!142, !132, !143, !70}
!143 = !DILocation(line: 79, column: 9, scope: !127)
!144 = !DILocation(line: 81, column: 9, scope: !119)
!145 = !DILocation(line: 81, column: 21, scope: !119)
!146 = !DILocation(line: 82, column: 19, scope: !119)
!147 = !DILocation(line: 82, column: 9, scope: !119)
!148 = !DILocation(line: 86, column: 1, scope: !98)
