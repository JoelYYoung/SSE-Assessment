; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %1, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !49
  %3 = load i32, i32* %arrayidx, align 4, !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  %5 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !50
  store i32 %3, i32* %arrayidx1, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %6, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !59
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !59
  call void @printIntLine(i32 %8), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_01_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #5, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #5, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_01_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_01_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  store i32* %arraydecay, i32** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !96
  call void @llvm.dbg.declare(metadata i64* %i, metadata !97, metadata !DIExpression()), !dbg !99
  store i64 0, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !103
  %cmp = icmp ult i64 %1, 100, !dbg !105
  br i1 %cmp, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !109
  %3 = load i32, i32* %arrayidx, align 4, !dbg !109
  %4 = load i32*, i32** %data, align 8, !dbg !110
  %5 = load i64, i64* %i, align 8, !dbg !111
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !110
  store i32 %3, i32* %arrayidx1, align 4, !dbg !112
  br label %for.inc, !dbg !113

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !114
  %inc = add i64 %6, 1, !dbg !114
  store i64 %inc, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !118
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !118
  call void @printIntLine(i32 %8), !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_01_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocation(line: 28, column: 12, scope: !11)
!30 = !DILocation(line: 28, column: 10, scope: !11)
!31 = !DILocalVariable(name: "source", scope: !32, file: !12, line: 30, type: !25)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!33 = !DILocation(line: 30, column: 13, scope: !32)
!34 = !DILocalVariable(name: "i", scope: !35, file: !12, line: 32, type: !36)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 31, column: 9)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 32, column: 20, scope: !35)
!40 = !DILocation(line: 34, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !12, line: 34, column: 13)
!42 = !DILocation(line: 34, column: 18, scope: !41)
!43 = !DILocation(line: 34, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 34, column: 13)
!45 = !DILocation(line: 34, column: 27, scope: !44)
!46 = !DILocation(line: 34, column: 13, scope: !41)
!47 = !DILocation(line: 36, column: 34, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 35, column: 13)
!49 = !DILocation(line: 36, column: 27, scope: !48)
!50 = !DILocation(line: 36, column: 17, scope: !48)
!51 = !DILocation(line: 36, column: 22, scope: !48)
!52 = !DILocation(line: 36, column: 25, scope: !48)
!53 = !DILocation(line: 37, column: 13, scope: !48)
!54 = !DILocation(line: 34, column: 35, scope: !44)
!55 = !DILocation(line: 34, column: 13, scope: !44)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 37, column: 13, scope: !41)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 38, column: 26, scope: !35)
!60 = !DILocation(line: 38, column: 13, scope: !35)
!61 = !DILocation(line: 41, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_01_good", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 71, column: 5, scope: !62)
!64 = !DILocation(line: 72, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 84, type: !66, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!17, !17, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 84, type: !17)
!72 = !DILocation(line: 84, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 84, type: !68)
!74 = !DILocation(line: 84, column: 27, scope: !65)
!75 = !DILocation(line: 87, column: 22, scope: !65)
!76 = !DILocation(line: 87, column: 12, scope: !65)
!77 = !DILocation(line: 87, column: 5, scope: !65)
!78 = !DILocation(line: 89, column: 5, scope: !65)
!79 = !DILocation(line: 90, column: 5, scope: !65)
!80 = !DILocation(line: 91, column: 5, scope: !65)
!81 = !DILocation(line: 94, column: 5, scope: !65)
!82 = !DILocation(line: 95, column: 5, scope: !65)
!83 = !DILocation(line: 96, column: 5, scope: !65)
!84 = !DILocation(line: 98, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 50, type: !16)
!87 = !DILocation(line: 50, column: 11, scope: !85)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !12, line: 51, type: !20)
!89 = !DILocation(line: 51, column: 9, scope: !85)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !12, line: 52, type: !25)
!91 = !DILocation(line: 52, column: 9, scope: !85)
!92 = !DILocation(line: 54, column: 12, scope: !85)
!93 = !DILocation(line: 54, column: 10, scope: !85)
!94 = !DILocalVariable(name: "source", scope: !95, file: !12, line: 56, type: !25)
!95 = distinct !DILexicalBlock(scope: !85, file: !12, line: 55, column: 5)
!96 = !DILocation(line: 56, column: 13, scope: !95)
!97 = !DILocalVariable(name: "i", scope: !98, file: !12, line: 58, type: !36)
!98 = distinct !DILexicalBlock(scope: !95, file: !12, line: 57, column: 9)
!99 = !DILocation(line: 58, column: 20, scope: !98)
!100 = !DILocation(line: 60, column: 20, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !12, line: 60, column: 13)
!102 = !DILocation(line: 60, column: 18, scope: !101)
!103 = !DILocation(line: 60, column: 25, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !12, line: 60, column: 13)
!105 = !DILocation(line: 60, column: 27, scope: !104)
!106 = !DILocation(line: 60, column: 13, scope: !101)
!107 = !DILocation(line: 62, column: 34, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !12, line: 61, column: 13)
!109 = !DILocation(line: 62, column: 27, scope: !108)
!110 = !DILocation(line: 62, column: 17, scope: !108)
!111 = !DILocation(line: 62, column: 22, scope: !108)
!112 = !DILocation(line: 62, column: 25, scope: !108)
!113 = !DILocation(line: 63, column: 13, scope: !108)
!114 = !DILocation(line: 60, column: 35, scope: !104)
!115 = !DILocation(line: 60, column: 13, scope: !104)
!116 = distinct !{!116, !106, !117, !58}
!117 = !DILocation(line: 63, column: 13, scope: !101)
!118 = !DILocation(line: 64, column: 26, scope: !98)
!119 = !DILocation(line: 64, column: 13, scope: !98)
!120 = !DILocation(line: 67, column: 1, scope: !85)
