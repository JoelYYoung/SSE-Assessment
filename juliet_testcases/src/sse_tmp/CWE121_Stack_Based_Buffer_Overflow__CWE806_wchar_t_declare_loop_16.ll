; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_16_bad() #0 !dbg !11 {
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
  br label %while.body, !dbg !28

while.body:                                       ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !29
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  br label %while.end, !dbg !34

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !45, metadata !DIExpression()), !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %call1 = call i64 @wcslen(i32* %3) #7, !dbg !48
  store i64 %call1, i64* %dataLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %while.end
  %4 = load i64, i64* %i, align 8, !dbg !53
  %5 = load i64, i64* %dataLen, align 8, !dbg !55
  %cmp = icmp ult i64 %4, %5, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !58
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !58
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !58
  %9 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !62
  store i32 %8, i32* %arrayidx3, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %10, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !70
  store i32 0, i32* %arrayidx4, align 4, !dbg !71
  %11 = load i32*, i32** %data, align 8, !dbg !72
  call void @printWLine(i32* %11), !dbg !73
  ret void, !dbg !74
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_16_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_16_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_16_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !103
  store i32* %arraydecay, i32** %data, align 8, !dbg !104
  br label %while.body, !dbg !105

while.body:                                       ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !106
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !108
  %1 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  br label %while.end, !dbg !111

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !117, metadata !DIExpression()), !dbg !118
  %3 = load i32*, i32** %data, align 8, !dbg !119
  %call1 = call i64 @wcslen(i32* %3) #7, !dbg !120
  store i64 %call1, i64* %dataLen, align 8, !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %while.end
  %4 = load i64, i64* %i, align 8, !dbg !125
  %5 = load i64, i64* %dataLen, align 8, !dbg !127
  %cmp = icmp ult i64 %4, %5, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !130
  %7 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !130
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !130
  %9 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !134
  store i32 %8, i32* %arrayidx3, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %10, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !141
  store i32 0, i32* %arrayidx4, align 4, !dbg !142
  %11 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %11), !dbg !144
  ret void, !dbg !145
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_16_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_16.c", directory: "/root/SSE-Assessment")
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
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 31, column: 17, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!31 = !DILocation(line: 31, column: 9, scope: !30)
!32 = !DILocation(line: 32, column: 9, scope: !30)
!33 = !DILocation(line: 32, column: 21, scope: !30)
!34 = !DILocation(line: 33, column: 9, scope: !30)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 36, column: 17, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 37, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 37, column: 16, scope: !36)
!45 = !DILocalVariable(name: "dataLen", scope: !36, file: !12, line: 37, type: !42)
!46 = !DILocation(line: 37, column: 19, scope: !36)
!47 = !DILocation(line: 38, column: 26, scope: !36)
!48 = !DILocation(line: 38, column: 19, scope: !36)
!49 = !DILocation(line: 38, column: 17, scope: !36)
!50 = !DILocation(line: 40, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !36, file: !12, line: 40, column: 9)
!52 = !DILocation(line: 40, column: 14, scope: !51)
!53 = !DILocation(line: 40, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !12, line: 40, column: 9)
!55 = !DILocation(line: 40, column: 25, scope: !54)
!56 = !DILocation(line: 40, column: 23, scope: !54)
!57 = !DILocation(line: 40, column: 9, scope: !51)
!58 = !DILocation(line: 42, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !12, line: 41, column: 9)
!60 = !DILocation(line: 42, column: 28, scope: !59)
!61 = !DILocation(line: 42, column: 18, scope: !59)
!62 = !DILocation(line: 42, column: 13, scope: !59)
!63 = !DILocation(line: 42, column: 21, scope: !59)
!64 = !DILocation(line: 43, column: 9, scope: !59)
!65 = !DILocation(line: 40, column: 35, scope: !54)
!66 = !DILocation(line: 40, column: 9, scope: !54)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 43, column: 9, scope: !51)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 44, column: 9, scope: !36)
!71 = !DILocation(line: 44, column: 20, scope: !36)
!72 = !DILocation(line: 45, column: 20, scope: !36)
!73 = !DILocation(line: 45, column: 9, scope: !36)
!74 = !DILocation(line: 47, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_16_good", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 82, column: 5, scope: !75)
!77 = !DILocation(line: 83, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 95, type: !79, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!19, !19, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !12, line: 95, type: !19)
!85 = !DILocation(line: 95, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !12, line: 95, type: !81)
!87 = !DILocation(line: 95, column: 27, scope: !78)
!88 = !DILocation(line: 98, column: 22, scope: !78)
!89 = !DILocation(line: 98, column: 12, scope: !78)
!90 = !DILocation(line: 98, column: 5, scope: !78)
!91 = !DILocation(line: 100, column: 5, scope: !78)
!92 = !DILocation(line: 101, column: 5, scope: !78)
!93 = !DILocation(line: 102, column: 5, scope: !78)
!94 = !DILocation(line: 105, column: 5, scope: !78)
!95 = !DILocation(line: 106, column: 5, scope: !78)
!96 = !DILocation(line: 107, column: 5, scope: !78)
!97 = !DILocation(line: 109, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 56, type: !16)
!100 = !DILocation(line: 56, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !12, line: 57, type: !22)
!102 = !DILocation(line: 57, column: 13, scope: !98)
!103 = !DILocation(line: 58, column: 12, scope: !98)
!104 = !DILocation(line: 58, column: 10, scope: !98)
!105 = !DILocation(line: 59, column: 5, scope: !98)
!106 = !DILocation(line: 62, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !98, file: !12, line: 60, column: 5)
!108 = !DILocation(line: 62, column: 9, scope: !107)
!109 = !DILocation(line: 63, column: 9, scope: !107)
!110 = !DILocation(line: 63, column: 20, scope: !107)
!111 = !DILocation(line: 64, column: 9, scope: !107)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !12, line: 67, type: !37)
!113 = distinct !DILexicalBlock(scope: !98, file: !12, line: 66, column: 5)
!114 = !DILocation(line: 67, column: 17, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !113, file: !12, line: 68, type: !42)
!116 = !DILocation(line: 68, column: 16, scope: !113)
!117 = !DILocalVariable(name: "dataLen", scope: !113, file: !12, line: 68, type: !42)
!118 = !DILocation(line: 68, column: 19, scope: !113)
!119 = !DILocation(line: 69, column: 26, scope: !113)
!120 = !DILocation(line: 69, column: 19, scope: !113)
!121 = !DILocation(line: 69, column: 17, scope: !113)
!122 = !DILocation(line: 71, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !113, file: !12, line: 71, column: 9)
!124 = !DILocation(line: 71, column: 14, scope: !123)
!125 = !DILocation(line: 71, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 71, column: 9)
!127 = !DILocation(line: 71, column: 25, scope: !126)
!128 = !DILocation(line: 71, column: 23, scope: !126)
!129 = !DILocation(line: 71, column: 9, scope: !123)
!130 = !DILocation(line: 73, column: 23, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !12, line: 72, column: 9)
!132 = !DILocation(line: 73, column: 28, scope: !131)
!133 = !DILocation(line: 73, column: 18, scope: !131)
!134 = !DILocation(line: 73, column: 13, scope: !131)
!135 = !DILocation(line: 73, column: 21, scope: !131)
!136 = !DILocation(line: 74, column: 9, scope: !131)
!137 = !DILocation(line: 71, column: 35, scope: !126)
!138 = !DILocation(line: 71, column: 9, scope: !126)
!139 = distinct !{!139, !129, !140, !69}
!140 = !DILocation(line: 74, column: 9, scope: !123)
!141 = !DILocation(line: 75, column: 9, scope: !113)
!142 = !DILocation(line: 75, column: 20, scope: !113)
!143 = !DILocation(line: 76, column: 20, scope: !113)
!144 = !DILocation(line: 76, column: 9, scope: !113)
!145 = !DILocation(line: 78, column: 1, scope: !98)
