; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memmove_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !28
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !29
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !35
  %cmp = icmp slt i32 %0, 1, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !39
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data, align 8, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %1, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !51
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !53
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx4, align 4, !dbg !55
  %2 = load i32*, i32** %data, align 8, !dbg !56
  %3 = bitcast i32* %2 to i8*, !dbg !57
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !57
  %4 = bitcast i32* %arraydecay5 to i8*, !dbg !57
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !57
  %5 = load i32*, i32** %data, align 8, !dbg !58
  %arrayidx6 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !58
  store i32 0, i32* %arrayidx6, align 4, !dbg !59
  %6 = load i32*, i32** %data, align 8, !dbg !60
  call void @printWLine(i32* %6), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memmove_17_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memmove_17_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memmove_17_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !93
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !94
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  store i32 0, i32* %h, align 4, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !100
  %cmp = icmp slt i32 %0, 1, !dbg !102
  br i1 %cmp, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !104
  store i32* %arraydecay1, i32** %data, align 8, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !108
  %inc = add nsw i32 %1, 1, !dbg !108
  store i32 %inc, i32* %h, align 4, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !116
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !117
  store i32 0, i32* %arrayidx4, align 4, !dbg !118
  %2 = load i32*, i32** %data, align 8, !dbg !119
  %3 = bitcast i32* %2 to i8*, !dbg !120
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !120
  %4 = bitcast i32* %arraydecay5 to i8*, !dbg !120
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !120
  %5 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx6 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !121
  store i32 0, i32* %arrayidx6, align 4, !dbg !122
  %6 = load i32*, i32** %data, align 8, !dbg !123
  call void @printWLine(i32* %6), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memmove_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !16)
!21 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!22 = !DILocation(line: 26, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 27, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 27, column: 13, scope: !11)
!28 = !DILocation(line: 28, column: 13, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 23, scope: !11)
!32 = !DILocation(line: 30, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!34 = !DILocation(line: 30, column: 9, scope: !33)
!35 = !DILocation(line: 30, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 30, column: 5)
!37 = !DILocation(line: 30, column: 18, scope: !36)
!38 = !DILocation(line: 30, column: 5, scope: !33)
!39 = !DILocation(line: 33, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 31, column: 5)
!41 = !DILocation(line: 33, column: 27, scope: !40)
!42 = !DILocation(line: 33, column: 14, scope: !40)
!43 = !DILocation(line: 34, column: 5, scope: !40)
!44 = !DILocation(line: 30, column: 24, scope: !36)
!45 = !DILocation(line: 30, column: 5, scope: !36)
!46 = distinct !{!46, !38, !47, !48}
!47 = !DILocation(line: 34, column: 5, scope: !33)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocalVariable(name: "source", scope: !50, file: !12, line: 36, type: !24)
!50 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!51 = !DILocation(line: 36, column: 17, scope: !50)
!52 = !DILocation(line: 37, column: 17, scope: !50)
!53 = !DILocation(line: 37, column: 9, scope: !50)
!54 = !DILocation(line: 38, column: 9, scope: !50)
!55 = !DILocation(line: 38, column: 23, scope: !50)
!56 = !DILocation(line: 40, column: 17, scope: !50)
!57 = !DILocation(line: 40, column: 9, scope: !50)
!58 = !DILocation(line: 42, column: 9, scope: !50)
!59 = !DILocation(line: 42, column: 21, scope: !50)
!60 = !DILocation(line: 43, column: 20, scope: !50)
!61 = !DILocation(line: 43, column: 9, scope: !50)
!62 = !DILocation(line: 45, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memmove_17_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 78, column: 5, scope: !63)
!65 = !DILocation(line: 79, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !67, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!16, !16, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 91, type: !16)
!73 = !DILocation(line: 91, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 91, type: !69)
!75 = !DILocation(line: 91, column: 27, scope: !66)
!76 = !DILocation(line: 94, column: 22, scope: !66)
!77 = !DILocation(line: 94, column: 12, scope: !66)
!78 = !DILocation(line: 94, column: 5, scope: !66)
!79 = !DILocation(line: 96, column: 5, scope: !66)
!80 = !DILocation(line: 97, column: 5, scope: !66)
!81 = !DILocation(line: 98, column: 5, scope: !66)
!82 = !DILocation(line: 101, column: 5, scope: !66)
!83 = !DILocation(line: 102, column: 5, scope: !66)
!84 = !DILocation(line: 103, column: 5, scope: !66)
!85 = !DILocation(line: 105, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "h", scope: !86, file: !12, line: 54, type: !16)
!88 = !DILocation(line: 54, column: 9, scope: !86)
!89 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 55, type: !19)
!90 = !DILocation(line: 55, column: 15, scope: !86)
!91 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !12, line: 56, type: !24)
!92 = !DILocation(line: 56, column: 13, scope: !86)
!93 = !DILocation(line: 57, column: 13, scope: !86)
!94 = !DILocation(line: 57, column: 5, scope: !86)
!95 = !DILocation(line: 58, column: 5, scope: !86)
!96 = !DILocation(line: 58, column: 23, scope: !86)
!97 = !DILocation(line: 59, column: 11, scope: !98)
!98 = distinct !DILexicalBlock(scope: !86, file: !12, line: 59, column: 5)
!99 = !DILocation(line: 59, column: 9, scope: !98)
!100 = !DILocation(line: 59, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !12, line: 59, column: 5)
!102 = !DILocation(line: 59, column: 18, scope: !101)
!103 = !DILocation(line: 59, column: 5, scope: !98)
!104 = !DILocation(line: 62, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !12, line: 60, column: 5)
!106 = !DILocation(line: 62, column: 14, scope: !105)
!107 = !DILocation(line: 63, column: 5, scope: !105)
!108 = !DILocation(line: 59, column: 24, scope: !101)
!109 = !DILocation(line: 59, column: 5, scope: !101)
!110 = distinct !{!110, !103, !111, !48}
!111 = !DILocation(line: 63, column: 5, scope: !98)
!112 = !DILocalVariable(name: "source", scope: !113, file: !12, line: 65, type: !24)
!113 = distinct !DILexicalBlock(scope: !86, file: !12, line: 64, column: 5)
!114 = !DILocation(line: 65, column: 17, scope: !113)
!115 = !DILocation(line: 66, column: 17, scope: !113)
!116 = !DILocation(line: 66, column: 9, scope: !113)
!117 = !DILocation(line: 67, column: 9, scope: !113)
!118 = !DILocation(line: 67, column: 23, scope: !113)
!119 = !DILocation(line: 69, column: 17, scope: !113)
!120 = !DILocation(line: 69, column: 9, scope: !113)
!121 = !DILocation(line: 71, column: 9, scope: !113)
!122 = !DILocation(line: 71, column: 21, scope: !113)
!123 = !DILocation(line: 72, column: 20, scope: !113)
!124 = !DILocation(line: 72, column: 9, scope: !113)
!125 = !DILocation(line: 74, column: 1, scope: !86)
