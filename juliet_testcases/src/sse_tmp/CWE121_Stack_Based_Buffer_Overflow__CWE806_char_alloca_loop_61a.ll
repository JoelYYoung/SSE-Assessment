; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61b_badSource(i8* %2), !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !27, metadata !DIExpression()), !dbg !32
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !38, metadata !DIExpression()), !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !41
  store i64 %call1, i64* %dataLen, align 8, !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !46
  %6 = load i64, i64* %dataLen, align 8, !dbg !48
  %cmp = icmp ult i64 %5, %6, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !51
  %8 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !51
  %9 = load i8, i8* %arrayidx, align 1, !dbg !51
  %10 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !55
  store i8 %9, i8* %arrayidx2, align 1, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %11, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !63
  store i8 0, i8* %arrayidx3, align 1, !dbg !64
  %12 = load i8*, i8** %data, align 8, !dbg !65
  call void @printLine(i8* %12), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #7, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #7, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 100, align 16, !dbg !95
  store i8* %0, i8** %dataBuffer, align 8, !dbg !94
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  store i8* %1, i8** %data, align 8, !dbg !97
  %2 = load i8*, i8** %data, align 8, !dbg !98
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61b_goodG2BSource(i8* %2), !dbg !99
  store i8* %call, i8** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !103
  call void @llvm.dbg.declare(metadata i64* %i, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !106, metadata !DIExpression()), !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !108
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !109
  store i64 %call1, i64* %dataLen, align 8, !dbg !110
  store i64 0, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !114
  %6 = load i64, i64* %dataLen, align 8, !dbg !116
  %cmp = icmp ult i64 %5, %6, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !119
  %8 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !119
  %9 = load i8, i8* %arrayidx, align 1, !dbg !119
  %10 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !123
  store i8 %9, i8* %arrayidx2, align 1, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !126
  %inc = add i64 %11, 1, !dbg !126
  store i64 %inc, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !130
  store i8 0, i8* %arrayidx3, align 1, !dbg !131
  %12 = load i8*, i8** %data, align 8, !dbg !132
  call void @printLine(i8* %12), !dbg !133
  ret void, !dbg !134
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 29, type: !4)
!20 = !DILocation(line: 29, column: 12, scope: !13)
!21 = !DILocation(line: 29, column: 33, scope: !13)
!22 = !DILocation(line: 30, column: 12, scope: !13)
!23 = !DILocation(line: 30, column: 10, scope: !13)
!24 = !DILocation(line: 31, column: 86, scope: !13)
!25 = !DILocation(line: 31, column: 12, scope: !13)
!26 = !DILocation(line: 31, column: 10, scope: !13)
!27 = !DILocalVariable(name: "dest", scope: !28, file: !14, line: 33, type: !29)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 33, column: 14, scope: !28)
!33 = !DILocalVariable(name: "i", scope: !28, file: !14, line: 34, type: !34)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 34, column: 16, scope: !28)
!38 = !DILocalVariable(name: "dataLen", scope: !28, file: !14, line: 34, type: !34)
!39 = !DILocation(line: 34, column: 19, scope: !28)
!40 = !DILocation(line: 35, column: 26, scope: !28)
!41 = !DILocation(line: 35, column: 19, scope: !28)
!42 = !DILocation(line: 35, column: 17, scope: !28)
!43 = !DILocation(line: 37, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !28, file: !14, line: 37, column: 9)
!45 = !DILocation(line: 37, column: 14, scope: !44)
!46 = !DILocation(line: 37, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !14, line: 37, column: 9)
!48 = !DILocation(line: 37, column: 25, scope: !47)
!49 = !DILocation(line: 37, column: 23, scope: !47)
!50 = !DILocation(line: 37, column: 9, scope: !44)
!51 = !DILocation(line: 39, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !14, line: 38, column: 9)
!53 = !DILocation(line: 39, column: 28, scope: !52)
!54 = !DILocation(line: 39, column: 18, scope: !52)
!55 = !DILocation(line: 39, column: 13, scope: !52)
!56 = !DILocation(line: 39, column: 21, scope: !52)
!57 = !DILocation(line: 40, column: 9, scope: !52)
!58 = !DILocation(line: 37, column: 35, scope: !47)
!59 = !DILocation(line: 37, column: 9, scope: !47)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 40, column: 9, scope: !44)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 41, column: 9, scope: !28)
!64 = !DILocation(line: 41, column: 20, scope: !28)
!65 = !DILocation(line: 42, column: 19, scope: !28)
!66 = !DILocation(line: 42, column: 9, scope: !28)
!67 = !DILocation(line: 44, column: 1, scope: !13)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_61_good", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 75, column: 5, scope: !68)
!70 = !DILocation(line: 76, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 88, type: !72, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !14, line: 88, type: !74)
!77 = !DILocation(line: 88, column: 14, scope: !71)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !14, line: 88, type: !75)
!79 = !DILocation(line: 88, column: 27, scope: !71)
!80 = !DILocation(line: 91, column: 22, scope: !71)
!81 = !DILocation(line: 91, column: 12, scope: !71)
!82 = !DILocation(line: 91, column: 5, scope: !71)
!83 = !DILocation(line: 93, column: 5, scope: !71)
!84 = !DILocation(line: 94, column: 5, scope: !71)
!85 = !DILocation(line: 95, column: 5, scope: !71)
!86 = !DILocation(line: 98, column: 5, scope: !71)
!87 = !DILocation(line: 99, column: 5, scope: !71)
!88 = !DILocation(line: 100, column: 5, scope: !71)
!89 = !DILocation(line: 102, column: 5, scope: !71)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !14, line: 55, type: !4)
!92 = !DILocation(line: 55, column: 12, scope: !90)
!93 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !14, line: 56, type: !4)
!94 = !DILocation(line: 56, column: 12, scope: !90)
!95 = !DILocation(line: 56, column: 33, scope: !90)
!96 = !DILocation(line: 57, column: 12, scope: !90)
!97 = !DILocation(line: 57, column: 10, scope: !90)
!98 = !DILocation(line: 58, column: 90, scope: !90)
!99 = !DILocation(line: 58, column: 12, scope: !90)
!100 = !DILocation(line: 58, column: 10, scope: !90)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !14, line: 60, type: !29)
!102 = distinct !DILexicalBlock(scope: !90, file: !14, line: 59, column: 5)
!103 = !DILocation(line: 60, column: 14, scope: !102)
!104 = !DILocalVariable(name: "i", scope: !102, file: !14, line: 61, type: !34)
!105 = !DILocation(line: 61, column: 16, scope: !102)
!106 = !DILocalVariable(name: "dataLen", scope: !102, file: !14, line: 61, type: !34)
!107 = !DILocation(line: 61, column: 19, scope: !102)
!108 = !DILocation(line: 62, column: 26, scope: !102)
!109 = !DILocation(line: 62, column: 19, scope: !102)
!110 = !DILocation(line: 62, column: 17, scope: !102)
!111 = !DILocation(line: 64, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !102, file: !14, line: 64, column: 9)
!113 = !DILocation(line: 64, column: 14, scope: !112)
!114 = !DILocation(line: 64, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !14, line: 64, column: 9)
!116 = !DILocation(line: 64, column: 25, scope: !115)
!117 = !DILocation(line: 64, column: 23, scope: !115)
!118 = !DILocation(line: 64, column: 9, scope: !112)
!119 = !DILocation(line: 66, column: 23, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !14, line: 65, column: 9)
!121 = !DILocation(line: 66, column: 28, scope: !120)
!122 = !DILocation(line: 66, column: 18, scope: !120)
!123 = !DILocation(line: 66, column: 13, scope: !120)
!124 = !DILocation(line: 66, column: 21, scope: !120)
!125 = !DILocation(line: 67, column: 9, scope: !120)
!126 = !DILocation(line: 64, column: 35, scope: !115)
!127 = !DILocation(line: 64, column: 9, scope: !115)
!128 = distinct !{!128, !118, !129, !62}
!129 = !DILocation(line: 67, column: 9, scope: !112)
!130 = !DILocation(line: 68, column: 9, scope: !102)
!131 = !DILocation(line: 68, column: 20, scope: !102)
!132 = !DILocation(line: 69, column: 19, scope: !102)
!133 = !DILocation(line: 69, column: 9, scope: !102)
!134 = !DILocation(line: 71, column: 1, scope: !90)
