; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !36
  %cmp = icmp slt i32 %0, 1, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i32* %arraydecay, i32** %data, align 8, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %2, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !55
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx2, align 4, !dbg !57
  %3 = load i32*, i32** %data, align 8, !dbg !58
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !59
  %call4 = call i32* @wcsncpy(i32* %3, i32* %arraydecay3, i64 99) #4, !dbg !60
  %4 = load i32*, i32** %data, align 8, !dbg !61
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !61
  store i32 0, i32* %arrayidx5, align 4, !dbg !62
  %5 = load i32*, i32** %data, align 8, !dbg !63
  call void @printWLine(i32* %5), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_17_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #4, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #4, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_17_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_17_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  store i32 0, i32* %h, align 4, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !101
  %cmp = icmp slt i32 %0, 1, !dbg !103
  br i1 %cmp, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !105
  store i32* %arraydecay, i32** %data, align 8, !dbg !107
  %1 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %h, align 4, !dbg !111
  %inc = add nsw i32 %2, 1, !dbg !111
  store i32 %inc, i32* %h, align 4, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !118
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !119
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx2, align 4, !dbg !121
  %3 = load i32*, i32** %data, align 8, !dbg !122
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %call4 = call i32* @wcsncpy(i32* %3, i32* %arraydecay3, i64 99) #4, !dbg !124
  %4 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !125
  store i32 0, i32* %arrayidx5, align 4, !dbg !126
  %5 = load i32*, i32** %data, align 8, !dbg !127
  call void @printWLine(i32* %5), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_17.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !16)
!21 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!22 = !DILocation(line: 26, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 27, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1600, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 27, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 28, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 28, column: 13, scope: !11)
!33 = !DILocation(line: 29, column: 11, scope: !34)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!35 = !DILocation(line: 29, column: 9, scope: !34)
!36 = !DILocation(line: 29, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 29, column: 5)
!38 = !DILocation(line: 29, column: 18, scope: !37)
!39 = !DILocation(line: 29, column: 5, scope: !34)
!40 = !DILocation(line: 33, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 30, column: 5)
!42 = !DILocation(line: 33, column: 14, scope: !41)
!43 = !DILocation(line: 34, column: 9, scope: !41)
!44 = !DILocation(line: 34, column: 17, scope: !41)
!45 = !DILocation(line: 35, column: 5, scope: !41)
!46 = !DILocation(line: 29, column: 24, scope: !37)
!47 = !DILocation(line: 29, column: 5, scope: !37)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 35, column: 5, scope: !34)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 37, type: !29)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!53 = !DILocation(line: 37, column: 17, scope: !52)
!54 = !DILocation(line: 38, column: 17, scope: !52)
!55 = !DILocation(line: 38, column: 9, scope: !52)
!56 = !DILocation(line: 39, column: 9, scope: !52)
!57 = !DILocation(line: 39, column: 23, scope: !52)
!58 = !DILocation(line: 41, column: 17, scope: !52)
!59 = !DILocation(line: 41, column: 23, scope: !52)
!60 = !DILocation(line: 41, column: 9, scope: !52)
!61 = !DILocation(line: 42, column: 9, scope: !52)
!62 = !DILocation(line: 42, column: 21, scope: !52)
!63 = !DILocation(line: 43, column: 20, scope: !52)
!64 = !DILocation(line: 43, column: 9, scope: !52)
!65 = !DILocation(line: 45, column: 1, scope: !11)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_17_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 77, column: 5, scope: !66)
!68 = !DILocation(line: 78, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !70, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!16, !16, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !12, line: 90, type: !16)
!76 = !DILocation(line: 90, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !12, line: 90, type: !72)
!78 = !DILocation(line: 90, column: 27, scope: !69)
!79 = !DILocation(line: 93, column: 22, scope: !69)
!80 = !DILocation(line: 93, column: 12, scope: !69)
!81 = !DILocation(line: 93, column: 5, scope: !69)
!82 = !DILocation(line: 95, column: 5, scope: !69)
!83 = !DILocation(line: 96, column: 5, scope: !69)
!84 = !DILocation(line: 97, column: 5, scope: !69)
!85 = !DILocation(line: 100, column: 5, scope: !69)
!86 = !DILocation(line: 101, column: 5, scope: !69)
!87 = !DILocation(line: 102, column: 5, scope: !69)
!88 = !DILocation(line: 104, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "h", scope: !89, file: !12, line: 54, type: !16)
!91 = !DILocation(line: 54, column: 9, scope: !89)
!92 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 55, type: !19)
!93 = !DILocation(line: 55, column: 15, scope: !89)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !89, file: !12, line: 56, type: !24)
!95 = !DILocation(line: 56, column: 13, scope: !89)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !89, file: !12, line: 57, type: !29)
!97 = !DILocation(line: 57, column: 13, scope: !89)
!98 = !DILocation(line: 58, column: 11, scope: !99)
!99 = distinct !DILexicalBlock(scope: !89, file: !12, line: 58, column: 5)
!100 = !DILocation(line: 58, column: 9, scope: !99)
!101 = !DILocation(line: 58, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !12, line: 58, column: 5)
!103 = !DILocation(line: 58, column: 18, scope: !102)
!104 = !DILocation(line: 58, column: 5, scope: !99)
!105 = !DILocation(line: 61, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !12, line: 59, column: 5)
!107 = !DILocation(line: 61, column: 14, scope: !106)
!108 = !DILocation(line: 62, column: 9, scope: !106)
!109 = !DILocation(line: 62, column: 17, scope: !106)
!110 = !DILocation(line: 63, column: 5, scope: !106)
!111 = !DILocation(line: 58, column: 24, scope: !102)
!112 = !DILocation(line: 58, column: 5, scope: !102)
!113 = distinct !{!113, !104, !114, !50}
!114 = !DILocation(line: 63, column: 5, scope: !99)
!115 = !DILocalVariable(name: "source", scope: !116, file: !12, line: 65, type: !29)
!116 = distinct !DILexicalBlock(scope: !89, file: !12, line: 64, column: 5)
!117 = !DILocation(line: 65, column: 17, scope: !116)
!118 = !DILocation(line: 66, column: 17, scope: !116)
!119 = !DILocation(line: 66, column: 9, scope: !116)
!120 = !DILocation(line: 67, column: 9, scope: !116)
!121 = !DILocation(line: 67, column: 23, scope: !116)
!122 = !DILocation(line: 69, column: 17, scope: !116)
!123 = !DILocation(line: 69, column: 23, scope: !116)
!124 = !DILocation(line: 69, column: 9, scope: !116)
!125 = !DILocation(line: 70, column: 9, scope: !116)
!126 = !DILocation(line: 70, column: 21, scope: !116)
!127 = !DILocation(line: 71, column: 20, scope: !116)
!128 = !DILocation(line: 71, column: 9, scope: !116)
!129 = !DILocation(line: 73, column: 1, scope: !89)
