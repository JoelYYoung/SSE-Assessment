; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !28
  store i32* %arraydecay, i32** %data, align 8, !dbg !29
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !33
  %cmp = icmp slt i32 %0, 1, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #7, !dbg !39
  %2 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %3, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !53
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !54
  %5 = bitcast i32* %arraydecay1 to i8*, !dbg !54
  %6 = load i32*, i32** %data, align 8, !dbg !55
  %7 = bitcast i32* %6 to i8*, !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !56
  %call2 = call i64 @wcslen(i32* %8) #8, !dbg !57
  %mul = mul i64 %call2, 4, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !54
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !59
  store i32 0, i32* %arrayidx3, align 4, !dbg !60
  %9 = load i32*, i32** %data, align 8, !dbg !61
  call void @printWLine(i32* %9), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_17_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_17_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_17_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !94
  store i32* %arraydecay, i32** %data, align 8, !dbg !95
  store i32 0, i32* %h, align 4, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !99
  %cmp = icmp slt i32 %0, 1, !dbg !101
  br i1 %cmp, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !105
  %2 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %h, align 4, !dbg !109
  %inc = add nsw i32 %3, 1, !dbg !109
  store i32 %inc, i32* %h, align 4, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !115
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !116
  %5 = bitcast i32* %arraydecay1 to i8*, !dbg !116
  %6 = load i32*, i32** %data, align 8, !dbg !117
  %7 = bitcast i32* %6 to i8*, !dbg !116
  %8 = load i32*, i32** %data, align 8, !dbg !118
  %call2 = call i64 @wcslen(i32* %8) #8, !dbg !119
  %mul = mul i64 %call2, 4, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !116
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !121
  store i32 0, i32* %arrayidx3, align 4, !dbg !122
  %9 = load i32*, i32** %data, align 8, !dbg !123
  call void @printWLine(i32* %9), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_17.c", directory: "/root/SSE-Assessment")
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
!23 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 27, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 27, column: 13, scope: !11)
!28 = !DILocation(line: 28, column: 12, scope: !11)
!29 = !DILocation(line: 28, column: 10, scope: !11)
!30 = !DILocation(line: 29, column: 11, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!32 = !DILocation(line: 29, column: 9, scope: !31)
!33 = !DILocation(line: 29, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 29, column: 5)
!35 = !DILocation(line: 29, column: 18, scope: !34)
!36 = !DILocation(line: 29, column: 5, scope: !31)
!37 = !DILocation(line: 32, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 30, column: 5)
!39 = !DILocation(line: 32, column: 9, scope: !38)
!40 = !DILocation(line: 33, column: 9, scope: !38)
!41 = !DILocation(line: 33, column: 21, scope: !38)
!42 = !DILocation(line: 34, column: 5, scope: !38)
!43 = !DILocation(line: 29, column: 24, scope: !34)
!44 = !DILocation(line: 29, column: 5, scope: !34)
!45 = distinct !{!45, !36, !46, !47}
!46 = !DILocation(line: 34, column: 5, scope: !31)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 36, type: !50)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1600, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 50)
!53 = !DILocation(line: 36, column: 17, scope: !49)
!54 = !DILocation(line: 38, column: 9, scope: !49)
!55 = !DILocation(line: 38, column: 22, scope: !49)
!56 = !DILocation(line: 38, column: 35, scope: !49)
!57 = !DILocation(line: 38, column: 28, scope: !49)
!58 = !DILocation(line: 38, column: 40, scope: !49)
!59 = !DILocation(line: 39, column: 9, scope: !49)
!60 = !DILocation(line: 39, column: 20, scope: !49)
!61 = !DILocation(line: 40, column: 20, scope: !49)
!62 = !DILocation(line: 40, column: 9, scope: !49)
!63 = !DILocation(line: 42, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_17_good", scope: !12, file: !12, line: 70, type: !13, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 72, column: 5, scope: !64)
!66 = !DILocation(line: 73, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 85, type: !68, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!16, !16, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 85, type: !16)
!74 = !DILocation(line: 85, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 85, type: !70)
!76 = !DILocation(line: 85, column: 27, scope: !67)
!77 = !DILocation(line: 88, column: 22, scope: !67)
!78 = !DILocation(line: 88, column: 12, scope: !67)
!79 = !DILocation(line: 88, column: 5, scope: !67)
!80 = !DILocation(line: 90, column: 5, scope: !67)
!81 = !DILocation(line: 91, column: 5, scope: !67)
!82 = !DILocation(line: 92, column: 5, scope: !67)
!83 = !DILocation(line: 95, column: 5, scope: !67)
!84 = !DILocation(line: 96, column: 5, scope: !67)
!85 = !DILocation(line: 97, column: 5, scope: !67)
!86 = !DILocation(line: 99, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "h", scope: !87, file: !12, line: 51, type: !16)
!89 = !DILocation(line: 51, column: 9, scope: !87)
!90 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 52, type: !19)
!91 = !DILocation(line: 52, column: 15, scope: !87)
!92 = !DILocalVariable(name: "dataBuffer", scope: !87, file: !12, line: 53, type: !24)
!93 = !DILocation(line: 53, column: 13, scope: !87)
!94 = !DILocation(line: 54, column: 12, scope: !87)
!95 = !DILocation(line: 54, column: 10, scope: !87)
!96 = !DILocation(line: 55, column: 11, scope: !97)
!97 = distinct !DILexicalBlock(scope: !87, file: !12, line: 55, column: 5)
!98 = !DILocation(line: 55, column: 9, scope: !97)
!99 = !DILocation(line: 55, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !12, line: 55, column: 5)
!101 = !DILocation(line: 55, column: 18, scope: !100)
!102 = !DILocation(line: 55, column: 5, scope: !97)
!103 = !DILocation(line: 58, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !12, line: 56, column: 5)
!105 = !DILocation(line: 58, column: 9, scope: !104)
!106 = !DILocation(line: 59, column: 9, scope: !104)
!107 = !DILocation(line: 59, column: 20, scope: !104)
!108 = !DILocation(line: 60, column: 5, scope: !104)
!109 = !DILocation(line: 55, column: 24, scope: !100)
!110 = !DILocation(line: 55, column: 5, scope: !100)
!111 = distinct !{!111, !102, !112, !47}
!112 = !DILocation(line: 60, column: 5, scope: !97)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !12, line: 62, type: !50)
!114 = distinct !DILexicalBlock(scope: !87, file: !12, line: 61, column: 5)
!115 = !DILocation(line: 62, column: 17, scope: !114)
!116 = !DILocation(line: 64, column: 9, scope: !114)
!117 = !DILocation(line: 64, column: 22, scope: !114)
!118 = !DILocation(line: 64, column: 35, scope: !114)
!119 = !DILocation(line: 64, column: 28, scope: !114)
!120 = !DILocation(line: 64, column: 40, scope: !114)
!121 = !DILocation(line: 65, column: 9, scope: !114)
!122 = !DILocation(line: 65, column: 20, scope: !114)
!123 = !DILocation(line: 66, column: 20, scope: !114)
!124 = !DILocation(line: 66, column: 9, scope: !114)
!125 = !DILocation(line: 68, column: 1, scope: !87)
