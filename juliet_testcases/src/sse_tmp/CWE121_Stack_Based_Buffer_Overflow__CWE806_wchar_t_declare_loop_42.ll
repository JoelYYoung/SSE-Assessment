; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_42_bad() #0 !dbg !11 {
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
  %call = call i32* @badSource(i32* %0), !dbg !29
  store i32* %call, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !41, metadata !DIExpression()), !dbg !42
  %2 = load i32*, i32** %data, align 8, !dbg !43
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !44
  store i64 %call1, i64* %dataLen, align 8, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !49
  %4 = load i64, i64* %dataLen, align 8, !dbg !51
  %cmp = icmp ult i64 %3, %4, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !54
  %7 = load i32, i32* %arrayidx, align 4, !dbg !54
  %8 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !58
  store i32 %7, i32* %arrayidx2, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %9, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !66
  store i32 0, i32* %arrayidx3, align 4, !dbg !67
  %10 = load i32*, i32** %data, align 8, !dbg !68
  call void @printWLine(i32* %10), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !71 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = load i32*, i32** %data.addr, align 8, !dbg !76
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #7, !dbg !77
  %1 = load i32*, i32** %data.addr, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  %2 = load i32*, i32** %data.addr, align 8, !dbg !80
  ret i32* %2, !dbg !81
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_42_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #7, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #7, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_42_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_42_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !110
  store i32* %arraydecay, i32** %data, align 8, !dbg !111
  %0 = load i32*, i32** %data, align 8, !dbg !112
  %call = call i32* @goodG2BSource(i32* %0), !dbg !113
  store i32* %call, i32** %data, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !115, metadata !DIExpression()), !dbg !117
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !120, metadata !DIExpression()), !dbg !121
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !123
  store i64 %call1, i64* %dataLen, align 8, !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !128
  %4 = load i64, i64* %dataLen, align 8, !dbg !130
  %cmp = icmp ult i64 %3, %4, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !133
  %6 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !133
  %7 = load i32, i32* %arrayidx, align 4, !dbg !133
  %8 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !137
  store i32 %7, i32* %arrayidx2, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %9, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !144
  store i32 0, i32* %arrayidx3, align 4, !dbg !145
  %10 = load i32*, i32** %data, align 8, !dbg !146
  call void @printWLine(i32* %10), !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !149 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !150, metadata !DIExpression()), !dbg !151
  %0 = load i32*, i32** %data.addr, align 8, !dbg !152
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !153
  %1 = load i32*, i32** %data.addr, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !154
  store i32 0, i32* %arrayidx, align 4, !dbg !155
  %2 = load i32*, i32** %data.addr, align 8, !dbg !156
  ret i32* %2, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_42_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_42.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 33, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 34, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 34, column: 13, scope: !11)
!26 = !DILocation(line: 35, column: 12, scope: !11)
!27 = !DILocation(line: 35, column: 10, scope: !11)
!28 = !DILocation(line: 36, column: 22, scope: !11)
!29 = !DILocation(line: 36, column: 12, scope: !11)
!30 = !DILocation(line: 36, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !12, line: 38, type: !33)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 38, column: 17, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !12, line: 39, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !39)
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 39, column: 16, scope: !32)
!41 = !DILocalVariable(name: "dataLen", scope: !32, file: !12, line: 39, type: !38)
!42 = !DILocation(line: 39, column: 19, scope: !32)
!43 = !DILocation(line: 40, column: 26, scope: !32)
!44 = !DILocation(line: 40, column: 19, scope: !32)
!45 = !DILocation(line: 40, column: 17, scope: !32)
!46 = !DILocation(line: 42, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !32, file: !12, line: 42, column: 9)
!48 = !DILocation(line: 42, column: 14, scope: !47)
!49 = !DILocation(line: 42, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 42, column: 9)
!51 = !DILocation(line: 42, column: 25, scope: !50)
!52 = !DILocation(line: 42, column: 23, scope: !50)
!53 = !DILocation(line: 42, column: 9, scope: !47)
!54 = !DILocation(line: 44, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !12, line: 43, column: 9)
!56 = !DILocation(line: 44, column: 28, scope: !55)
!57 = !DILocation(line: 44, column: 18, scope: !55)
!58 = !DILocation(line: 44, column: 13, scope: !55)
!59 = !DILocation(line: 44, column: 21, scope: !55)
!60 = !DILocation(line: 45, column: 9, scope: !55)
!61 = !DILocation(line: 42, column: 35, scope: !50)
!62 = !DILocation(line: 42, column: 9, scope: !50)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 45, column: 9, scope: !47)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 46, column: 9, scope: !32)
!67 = !DILocation(line: 46, column: 20, scope: !32)
!68 = !DILocation(line: 47, column: 20, scope: !32)
!69 = !DILocation(line: 47, column: 9, scope: !32)
!70 = !DILocation(line: 49, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 23, type: !72, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!16, !16}
!74 = !DILocalVariable(name: "data", arg: 1, scope: !71, file: !12, line: 23, type: !16)
!75 = !DILocation(line: 23, column: 38, scope: !71)
!76 = !DILocation(line: 26, column: 13, scope: !71)
!77 = !DILocation(line: 26, column: 5, scope: !71)
!78 = !DILocation(line: 27, column: 5, scope: !71)
!79 = !DILocation(line: 27, column: 17, scope: !71)
!80 = !DILocation(line: 28, column: 12, scope: !71)
!81 = !DILocation(line: 28, column: 5, scope: !71)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_42_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 86, column: 5, scope: !82)
!84 = !DILocation(line: 87, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !86, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!19, !19, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 99, type: !19)
!92 = !DILocation(line: 99, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 99, type: !88)
!94 = !DILocation(line: 99, column: 27, scope: !85)
!95 = !DILocation(line: 102, column: 22, scope: !85)
!96 = !DILocation(line: 102, column: 12, scope: !85)
!97 = !DILocation(line: 102, column: 5, scope: !85)
!98 = !DILocation(line: 104, column: 5, scope: !85)
!99 = !DILocation(line: 105, column: 5, scope: !85)
!100 = !DILocation(line: 106, column: 5, scope: !85)
!101 = !DILocation(line: 109, column: 5, scope: !85)
!102 = !DILocation(line: 110, column: 5, scope: !85)
!103 = !DILocation(line: 111, column: 5, scope: !85)
!104 = !DILocation(line: 113, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 64, type: !13, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 66, type: !16)
!107 = !DILocation(line: 66, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !12, line: 67, type: !22)
!109 = !DILocation(line: 67, column: 13, scope: !105)
!110 = !DILocation(line: 68, column: 12, scope: !105)
!111 = !DILocation(line: 68, column: 10, scope: !105)
!112 = !DILocation(line: 69, column: 26, scope: !105)
!113 = !DILocation(line: 69, column: 12, scope: !105)
!114 = !DILocation(line: 69, column: 10, scope: !105)
!115 = !DILocalVariable(name: "dest", scope: !116, file: !12, line: 71, type: !33)
!116 = distinct !DILexicalBlock(scope: !105, file: !12, line: 70, column: 5)
!117 = !DILocation(line: 71, column: 17, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !116, file: !12, line: 72, type: !38)
!119 = !DILocation(line: 72, column: 16, scope: !116)
!120 = !DILocalVariable(name: "dataLen", scope: !116, file: !12, line: 72, type: !38)
!121 = !DILocation(line: 72, column: 19, scope: !116)
!122 = !DILocation(line: 73, column: 26, scope: !116)
!123 = !DILocation(line: 73, column: 19, scope: !116)
!124 = !DILocation(line: 73, column: 17, scope: !116)
!125 = !DILocation(line: 75, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !116, file: !12, line: 75, column: 9)
!127 = !DILocation(line: 75, column: 14, scope: !126)
!128 = !DILocation(line: 75, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !12, line: 75, column: 9)
!130 = !DILocation(line: 75, column: 25, scope: !129)
!131 = !DILocation(line: 75, column: 23, scope: !129)
!132 = !DILocation(line: 75, column: 9, scope: !126)
!133 = !DILocation(line: 77, column: 23, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !12, line: 76, column: 9)
!135 = !DILocation(line: 77, column: 28, scope: !134)
!136 = !DILocation(line: 77, column: 18, scope: !134)
!137 = !DILocation(line: 77, column: 13, scope: !134)
!138 = !DILocation(line: 77, column: 21, scope: !134)
!139 = !DILocation(line: 78, column: 9, scope: !134)
!140 = !DILocation(line: 75, column: 35, scope: !129)
!141 = !DILocation(line: 75, column: 9, scope: !129)
!142 = distinct !{!142, !132, !143, !65}
!143 = !DILocation(line: 78, column: 9, scope: !126)
!144 = !DILocation(line: 79, column: 9, scope: !116)
!145 = !DILocation(line: 79, column: 20, scope: !116)
!146 = !DILocation(line: 80, column: 20, scope: !116)
!147 = !DILocation(line: 80, column: 9, scope: !116)
!148 = !DILocation(line: 82, column: 1, scope: !105)
!149 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 55, type: !72, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", arg: 1, scope: !149, file: !12, line: 55, type: !16)
!151 = !DILocation(line: 55, column: 42, scope: !149)
!152 = !DILocation(line: 58, column: 13, scope: !149)
!153 = !DILocation(line: 58, column: 5, scope: !149)
!154 = !DILocation(line: 59, column: 5, scope: !149)
!155 = !DILocation(line: 59, column: 16, scope: !149)
!156 = !DILocation(line: 60, column: 12, scope: !149)
!157 = !DILocation(line: 60, column: 5, scope: !149)
