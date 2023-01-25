; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !42, metadata !DIExpression()), !dbg !43
  %3 = load i32*, i32** %data, align 8, !dbg !44
  %call1 = call i64 @wcslen(i32* %3) #7, !dbg !45
  store i64 %call1, i64* %dataLen, align 8, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !50
  %5 = load i64, i64* %dataLen, align 8, !dbg !52
  %cmp = icmp ult i64 %4, %5, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !55
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !55
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !55
  %9 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !59
  store i32 %8, i32* %arrayidx3, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %10, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !67
  store i32 0, i32* %arrayidx4, align 4, !dbg !68
  %11 = load i32*, i32** %data, align 8, !dbg !69
  call void @printWLine(i32* %11), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_01_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #6, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #6, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_01_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_01_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !100
  store i32* %arraydecay, i32** %data, align 8, !dbg !101
  %0 = load i32*, i32** %data, align 8, !dbg !102
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !103
  %1 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !111, metadata !DIExpression()), !dbg !112
  %3 = load i32*, i32** %data, align 8, !dbg !113
  %call1 = call i64 @wcslen(i32* %3) #7, !dbg !114
  store i64 %call1, i64* %dataLen, align 8, !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !119
  %5 = load i64, i64* %dataLen, align 8, !dbg !121
  %cmp = icmp ult i64 %4, %5, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !124
  %7 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !124
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !124
  %9 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !128
  store i32 %8, i32* %arrayidx3, align 4, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %10, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !135
  store i32 0, i32* %arrayidx4, align 4, !dbg !136
  %11 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* %11), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 12, scope: !11)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 29, column: 13, scope: !11)
!29 = !DILocation(line: 29, column: 5, scope: !11)
!30 = !DILocation(line: 30, column: 5, scope: !11)
!31 = !DILocation(line: 30, column: 17, scope: !11)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !12, line: 32, type: !34)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 32, column: 17, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !12, line: 33, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 33, column: 16, scope: !33)
!42 = !DILocalVariable(name: "dataLen", scope: !33, file: !12, line: 33, type: !39)
!43 = !DILocation(line: 33, column: 19, scope: !33)
!44 = !DILocation(line: 34, column: 26, scope: !33)
!45 = !DILocation(line: 34, column: 19, scope: !33)
!46 = !DILocation(line: 34, column: 17, scope: !33)
!47 = !DILocation(line: 36, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !33, file: !12, line: 36, column: 9)
!49 = !DILocation(line: 36, column: 14, scope: !48)
!50 = !DILocation(line: 36, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 36, column: 9)
!52 = !DILocation(line: 36, column: 25, scope: !51)
!53 = !DILocation(line: 36, column: 23, scope: !51)
!54 = !DILocation(line: 36, column: 9, scope: !48)
!55 = !DILocation(line: 38, column: 23, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !12, line: 37, column: 9)
!57 = !DILocation(line: 38, column: 28, scope: !56)
!58 = !DILocation(line: 38, column: 18, scope: !56)
!59 = !DILocation(line: 38, column: 13, scope: !56)
!60 = !DILocation(line: 38, column: 21, scope: !56)
!61 = !DILocation(line: 39, column: 9, scope: !56)
!62 = !DILocation(line: 36, column: 35, scope: !51)
!63 = !DILocation(line: 36, column: 9, scope: !51)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 39, column: 9, scope: !48)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 40, column: 9, scope: !33)
!68 = !DILocation(line: 40, column: 20, scope: !33)
!69 = !DILocation(line: 41, column: 20, scope: !33)
!70 = !DILocation(line: 41, column: 9, scope: !33)
!71 = !DILocation(line: 43, column: 1, scope: !11)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_01_good", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 74, column: 5, scope: !72)
!74 = !DILocation(line: 75, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !76, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!19, !19, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 87, type: !19)
!82 = !DILocation(line: 87, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 87, type: !78)
!84 = !DILocation(line: 87, column: 27, scope: !75)
!85 = !DILocation(line: 90, column: 22, scope: !75)
!86 = !DILocation(line: 90, column: 12, scope: !75)
!87 = !DILocation(line: 90, column: 5, scope: !75)
!88 = !DILocation(line: 92, column: 5, scope: !75)
!89 = !DILocation(line: 93, column: 5, scope: !75)
!90 = !DILocation(line: 94, column: 5, scope: !75)
!91 = !DILocation(line: 97, column: 5, scope: !75)
!92 = !DILocation(line: 98, column: 5, scope: !75)
!93 = !DILocation(line: 99, column: 5, scope: !75)
!94 = !DILocation(line: 101, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 52, type: !16)
!97 = !DILocation(line: 52, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !12, line: 53, type: !22)
!99 = !DILocation(line: 53, column: 13, scope: !95)
!100 = !DILocation(line: 54, column: 12, scope: !95)
!101 = !DILocation(line: 54, column: 10, scope: !95)
!102 = !DILocation(line: 56, column: 13, scope: !95)
!103 = !DILocation(line: 56, column: 5, scope: !95)
!104 = !DILocation(line: 57, column: 5, scope: !95)
!105 = !DILocation(line: 57, column: 16, scope: !95)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !12, line: 59, type: !34)
!107 = distinct !DILexicalBlock(scope: !95, file: !12, line: 58, column: 5)
!108 = !DILocation(line: 59, column: 17, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !107, file: !12, line: 60, type: !39)
!110 = !DILocation(line: 60, column: 16, scope: !107)
!111 = !DILocalVariable(name: "dataLen", scope: !107, file: !12, line: 60, type: !39)
!112 = !DILocation(line: 60, column: 19, scope: !107)
!113 = !DILocation(line: 61, column: 26, scope: !107)
!114 = !DILocation(line: 61, column: 19, scope: !107)
!115 = !DILocation(line: 61, column: 17, scope: !107)
!116 = !DILocation(line: 63, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !12, line: 63, column: 9)
!118 = !DILocation(line: 63, column: 14, scope: !117)
!119 = !DILocation(line: 63, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 63, column: 9)
!121 = !DILocation(line: 63, column: 25, scope: !120)
!122 = !DILocation(line: 63, column: 23, scope: !120)
!123 = !DILocation(line: 63, column: 9, scope: !117)
!124 = !DILocation(line: 65, column: 23, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !12, line: 64, column: 9)
!126 = !DILocation(line: 65, column: 28, scope: !125)
!127 = !DILocation(line: 65, column: 18, scope: !125)
!128 = !DILocation(line: 65, column: 13, scope: !125)
!129 = !DILocation(line: 65, column: 21, scope: !125)
!130 = !DILocation(line: 66, column: 9, scope: !125)
!131 = !DILocation(line: 63, column: 35, scope: !120)
!132 = !DILocation(line: 63, column: 9, scope: !120)
!133 = distinct !{!133, !123, !134, !66}
!134 = !DILocation(line: 66, column: 9, scope: !117)
!135 = !DILocation(line: 67, column: 9, scope: !107)
!136 = !DILocation(line: 67, column: 20, scope: !107)
!137 = !DILocation(line: 68, column: 20, scope: !107)
!138 = !DILocation(line: 68, column: 9, scope: !107)
!139 = !DILocation(line: 70, column: 1, scope: !95)
