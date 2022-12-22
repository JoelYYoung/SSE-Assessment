; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  store i32* %2, i32** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !38
  store i32* %3, i32** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !50
  %5 = load i32*, i32** %data1, align 8, !dbg !51
  %call2 = call i64 @wcslen(i32* %5) #7, !dbg !52
  store i64 %call2, i64* %dataLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !57
  %7 = load i64, i64* %dataLen, align 8, !dbg !59
  %cmp = icmp ult i64 %6, %7, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data1, align 8, !dbg !62
  %9 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !62
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !62
  %11 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !66
  store i32 %10, i32* %arrayidx4, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %12, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !74
  store i32 0, i32* %arrayidx5, align 4, !dbg !75
  %13 = load i32*, i32** %data1, align 8, !dbg !76
  call void @printWLine(i32* %13), !dbg !77
  ret void, !dbg !78
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_31_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #6, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #6, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_31_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_31_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay, i32** %data, align 8, !dbg !108
  %0 = load i32*, i32** %data, align 8, !dbg !109
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !110
  %1 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !113, metadata !DIExpression()), !dbg !115
  %2 = load i32*, i32** %data, align 8, !dbg !116
  store i32* %2, i32** %dataCopy, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !117, metadata !DIExpression()), !dbg !118
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !119
  store i32* %3, i32** %data1, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !125, metadata !DIExpression()), !dbg !126
  %5 = load i32*, i32** %data1, align 8, !dbg !127
  %call2 = call i64 @wcslen(i32* %5) #7, !dbg !128
  store i64 %call2, i64* %dataLen, align 8, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !133
  %7 = load i64, i64* %dataLen, align 8, !dbg !135
  %cmp = icmp ult i64 %6, %7, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data1, align 8, !dbg !138
  %9 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !138
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !138
  %11 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !142
  store i32 %10, i32* %arrayidx4, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %12, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !149
  store i32 0, i32* %arrayidx5, align 4, !dbg !150
  %13 = load i32*, i32** %data1, align 8, !dbg !151
  call void @printWLine(i32* %13), !dbg !152
  ret void, !dbg !153
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_31.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
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
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !12, line: 32, type: !16)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!34 = !DILocation(line: 32, column: 19, scope: !33)
!35 = !DILocation(line: 32, column: 30, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !12, line: 33, type: !16)
!37 = !DILocation(line: 33, column: 19, scope: !33)
!38 = !DILocation(line: 33, column: 26, scope: !33)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !12, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !12, line: 34, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 35, column: 21, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !12, line: 36, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 36, column: 20, scope: !40)
!49 = !DILocalVariable(name: "dataLen", scope: !40, file: !12, line: 36, type: !46)
!50 = !DILocation(line: 36, column: 23, scope: !40)
!51 = !DILocation(line: 37, column: 30, scope: !40)
!52 = !DILocation(line: 37, column: 23, scope: !40)
!53 = !DILocation(line: 37, column: 21, scope: !40)
!54 = !DILocation(line: 39, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !40, file: !12, line: 39, column: 13)
!56 = !DILocation(line: 39, column: 18, scope: !55)
!57 = !DILocation(line: 39, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 39, column: 13)
!59 = !DILocation(line: 39, column: 29, scope: !58)
!60 = !DILocation(line: 39, column: 27, scope: !58)
!61 = !DILocation(line: 39, column: 13, scope: !55)
!62 = !DILocation(line: 41, column: 27, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !12, line: 40, column: 13)
!64 = !DILocation(line: 41, column: 32, scope: !63)
!65 = !DILocation(line: 41, column: 22, scope: !63)
!66 = !DILocation(line: 41, column: 17, scope: !63)
!67 = !DILocation(line: 41, column: 25, scope: !63)
!68 = !DILocation(line: 42, column: 13, scope: !63)
!69 = !DILocation(line: 39, column: 39, scope: !58)
!70 = !DILocation(line: 39, column: 13, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 42, column: 13, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 43, column: 13, scope: !40)
!75 = !DILocation(line: 43, column: 24, scope: !40)
!76 = !DILocation(line: 44, column: 24, scope: !40)
!77 = !DILocation(line: 44, column: 13, scope: !40)
!78 = !DILocation(line: 47, column: 1, scope: !11)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_31_good", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 82, column: 5, scope: !79)
!81 = !DILocation(line: 83, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !83, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!19, !19, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 94, type: !19)
!89 = !DILocation(line: 94, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 94, type: !85)
!91 = !DILocation(line: 94, column: 27, scope: !82)
!92 = !DILocation(line: 97, column: 22, scope: !82)
!93 = !DILocation(line: 97, column: 12, scope: !82)
!94 = !DILocation(line: 97, column: 5, scope: !82)
!95 = !DILocation(line: 99, column: 5, scope: !82)
!96 = !DILocation(line: 100, column: 5, scope: !82)
!97 = !DILocation(line: 101, column: 5, scope: !82)
!98 = !DILocation(line: 104, column: 5, scope: !82)
!99 = !DILocation(line: 105, column: 5, scope: !82)
!100 = !DILocation(line: 106, column: 5, scope: !82)
!101 = !DILocation(line: 108, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 56, type: !16)
!104 = !DILocation(line: 56, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !12, line: 57, type: !22)
!106 = !DILocation(line: 57, column: 13, scope: !102)
!107 = !DILocation(line: 58, column: 12, scope: !102)
!108 = !DILocation(line: 58, column: 10, scope: !102)
!109 = !DILocation(line: 60, column: 13, scope: !102)
!110 = !DILocation(line: 60, column: 5, scope: !102)
!111 = !DILocation(line: 61, column: 5, scope: !102)
!112 = !DILocation(line: 61, column: 16, scope: !102)
!113 = !DILocalVariable(name: "dataCopy", scope: !114, file: !12, line: 63, type: !16)
!114 = distinct !DILexicalBlock(scope: !102, file: !12, line: 62, column: 5)
!115 = !DILocation(line: 63, column: 19, scope: !114)
!116 = !DILocation(line: 63, column: 30, scope: !114)
!117 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 64, type: !16)
!118 = !DILocation(line: 64, column: 19, scope: !114)
!119 = !DILocation(line: 64, column: 26, scope: !114)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !12, line: 66, type: !41)
!121 = distinct !DILexicalBlock(scope: !114, file: !12, line: 65, column: 9)
!122 = !DILocation(line: 66, column: 21, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !121, file: !12, line: 67, type: !46)
!124 = !DILocation(line: 67, column: 20, scope: !121)
!125 = !DILocalVariable(name: "dataLen", scope: !121, file: !12, line: 67, type: !46)
!126 = !DILocation(line: 67, column: 23, scope: !121)
!127 = !DILocation(line: 68, column: 30, scope: !121)
!128 = !DILocation(line: 68, column: 23, scope: !121)
!129 = !DILocation(line: 68, column: 21, scope: !121)
!130 = !DILocation(line: 70, column: 20, scope: !131)
!131 = distinct !DILexicalBlock(scope: !121, file: !12, line: 70, column: 13)
!132 = !DILocation(line: 70, column: 18, scope: !131)
!133 = !DILocation(line: 70, column: 25, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 70, column: 13)
!135 = !DILocation(line: 70, column: 29, scope: !134)
!136 = !DILocation(line: 70, column: 27, scope: !134)
!137 = !DILocation(line: 70, column: 13, scope: !131)
!138 = !DILocation(line: 72, column: 27, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !12, line: 71, column: 13)
!140 = !DILocation(line: 72, column: 32, scope: !139)
!141 = !DILocation(line: 72, column: 22, scope: !139)
!142 = !DILocation(line: 72, column: 17, scope: !139)
!143 = !DILocation(line: 72, column: 25, scope: !139)
!144 = !DILocation(line: 73, column: 13, scope: !139)
!145 = !DILocation(line: 70, column: 39, scope: !134)
!146 = !DILocation(line: 70, column: 13, scope: !134)
!147 = distinct !{!147, !137, !148, !73}
!148 = !DILocation(line: 73, column: 13, scope: !131)
!149 = !DILocation(line: 74, column: 13, scope: !121)
!150 = !DILocation(line: 74, column: 24, scope: !121)
!151 = !DILocation(line: 75, column: 24, scope: !121)
!152 = !DILocation(line: 75, column: 13, scope: !121)
!153 = !DILocation(line: 78, column: 1, scope: !102)
