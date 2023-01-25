; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source1 = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  br label %source, !dbg !29

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !30), !dbg !31
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i32* %arraydecay, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = bitcast [100 x i32]* %source1 to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %source
  %1 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %1, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 %2, !dbg !52
  %3 = load i32, i32* %arrayidx, align 4, !dbg !52
  %4 = load i32*, i32** %data, align 8, !dbg !53
  %5 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !53
  store i32 %3, i32* %arrayidx2, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %6, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !62
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !62
  call void @printIntLine(i32 %8), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_18_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_18_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_18_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source1 = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  br label %source, !dbg !95

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !96), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  store i32* %arraydecay, i32** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !100, metadata !DIExpression()), !dbg !102
  %0 = bitcast [100 x i32]* %source1 to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !102
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !DIExpression()), !dbg !105
  store i64 0, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %source
  %1 = load i64, i64* %i, align 8, !dbg !109
  %cmp = icmp ult i64 %1, 100, !dbg !111
  br i1 %cmp, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 %2, !dbg !115
  %3 = load i32, i32* %arrayidx, align 4, !dbg !115
  %4 = load i32*, i32** %data, align 8, !dbg !116
  %5 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !116
  store i32 %3, i32* %arrayidx2, align 4, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !120
  %inc = add i64 %6, 1, !dbg !120
  store i64 %inc, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !124
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !124
  call void @printIntLine(i32 %8), !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_18_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 11, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 24, column: 9, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 25, column: 9, scope: !11)
!29 = !DILocation(line: 26, column: 5, scope: !11)
!30 = !DILabel(scope: !11, name: "source", file: !12, line: 27)
!31 = !DILocation(line: 27, column: 1, scope: !11)
!32 = !DILocation(line: 30, column: 12, scope: !11)
!33 = !DILocation(line: 30, column: 10, scope: !11)
!34 = !DILocalVariable(name: "source", scope: !35, file: !12, line: 32, type: !25)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!36 = !DILocation(line: 32, column: 13, scope: !35)
!37 = !DILocalVariable(name: "i", scope: !38, file: !12, line: 34, type: !39)
!38 = distinct !DILexicalBlock(scope: !35, file: !12, line: 33, column: 9)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 34, column: 20, scope: !38)
!43 = !DILocation(line: 36, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !12, line: 36, column: 13)
!45 = !DILocation(line: 36, column: 18, scope: !44)
!46 = !DILocation(line: 36, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !12, line: 36, column: 13)
!48 = !DILocation(line: 36, column: 27, scope: !47)
!49 = !DILocation(line: 36, column: 13, scope: !44)
!50 = !DILocation(line: 38, column: 34, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !12, line: 37, column: 13)
!52 = !DILocation(line: 38, column: 27, scope: !51)
!53 = !DILocation(line: 38, column: 17, scope: !51)
!54 = !DILocation(line: 38, column: 22, scope: !51)
!55 = !DILocation(line: 38, column: 25, scope: !51)
!56 = !DILocation(line: 39, column: 13, scope: !51)
!57 = !DILocation(line: 36, column: 35, scope: !47)
!58 = !DILocation(line: 36, column: 13, scope: !47)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 39, column: 13, scope: !44)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 40, column: 26, scope: !38)
!63 = !DILocation(line: 40, column: 13, scope: !38)
!64 = !DILocation(line: 43, column: 1, scope: !11)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_18_good", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 75, column: 5, scope: !65)
!67 = !DILocation(line: 76, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 88, type: !69, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!17, !17, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 88, type: !17)
!75 = !DILocation(line: 88, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 88, type: !71)
!77 = !DILocation(line: 88, column: 27, scope: !68)
!78 = !DILocation(line: 91, column: 22, scope: !68)
!79 = !DILocation(line: 91, column: 12, scope: !68)
!80 = !DILocation(line: 91, column: 5, scope: !68)
!81 = !DILocation(line: 93, column: 5, scope: !68)
!82 = !DILocation(line: 94, column: 5, scope: !68)
!83 = !DILocation(line: 95, column: 5, scope: !68)
!84 = !DILocation(line: 98, column: 5, scope: !68)
!85 = !DILocation(line: 99, column: 5, scope: !68)
!86 = !DILocation(line: 100, column: 5, scope: !68)
!87 = !DILocation(line: 102, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 52, type: !16)
!90 = !DILocation(line: 52, column: 11, scope: !88)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !12, line: 53, type: !20)
!92 = !DILocation(line: 53, column: 9, scope: !88)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !12, line: 54, type: !25)
!94 = !DILocation(line: 54, column: 9, scope: !88)
!95 = !DILocation(line: 55, column: 5, scope: !88)
!96 = !DILabel(scope: !88, name: "source", file: !12, line: 56)
!97 = !DILocation(line: 56, column: 1, scope: !88)
!98 = !DILocation(line: 58, column: 12, scope: !88)
!99 = !DILocation(line: 58, column: 10, scope: !88)
!100 = !DILocalVariable(name: "source", scope: !101, file: !12, line: 60, type: !25)
!101 = distinct !DILexicalBlock(scope: !88, file: !12, line: 59, column: 5)
!102 = !DILocation(line: 60, column: 13, scope: !101)
!103 = !DILocalVariable(name: "i", scope: !104, file: !12, line: 62, type: !39)
!104 = distinct !DILexicalBlock(scope: !101, file: !12, line: 61, column: 9)
!105 = !DILocation(line: 62, column: 20, scope: !104)
!106 = !DILocation(line: 64, column: 20, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 64, column: 13)
!108 = !DILocation(line: 64, column: 18, scope: !107)
!109 = !DILocation(line: 64, column: 25, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 64, column: 13)
!111 = !DILocation(line: 64, column: 27, scope: !110)
!112 = !DILocation(line: 64, column: 13, scope: !107)
!113 = !DILocation(line: 66, column: 34, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 65, column: 13)
!115 = !DILocation(line: 66, column: 27, scope: !114)
!116 = !DILocation(line: 66, column: 17, scope: !114)
!117 = !DILocation(line: 66, column: 22, scope: !114)
!118 = !DILocation(line: 66, column: 25, scope: !114)
!119 = !DILocation(line: 67, column: 13, scope: !114)
!120 = !DILocation(line: 64, column: 35, scope: !110)
!121 = !DILocation(line: 64, column: 13, scope: !110)
!122 = distinct !{!122, !112, !123, !61}
!123 = !DILocation(line: 67, column: 13, scope: !107)
!124 = !DILocation(line: 68, column: 26, scope: !104)
!125 = !DILocation(line: 68, column: 13, scope: !104)
!126 = !DILocation(line: 71, column: 1, scope: !88)
