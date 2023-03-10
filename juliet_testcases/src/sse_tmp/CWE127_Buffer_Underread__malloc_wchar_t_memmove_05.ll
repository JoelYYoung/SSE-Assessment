; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end3, !dbg !30

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !35
  %1 = bitcast i8* %call to i32*, !dbg !36
  store i32* %1, i32** %dataBuffer, align 8, !dbg !34
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  %cmp = icmp eq i32* %2, null, !dbg !39
  br i1 %cmp, label %if.then1, label %if.end, !dbg !40

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !44
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !47
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !48
  store i32* %add.ptr, i32** %data, align 8, !dbg !49
  br label %if.end3, !dbg !50

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !58
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx5, align 4, !dbg !60
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %6 = bitcast i32* %arraydecay6 to i8*, !dbg !61
  %7 = load i32*, i32** %data, align 8, !dbg !62
  %8 = bitcast i32* %7 to i8*, !dbg !61
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 400, i1 false), !dbg !61
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx7, align 4, !dbg !64
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  call void @printWLine(i32* %arraydecay8), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_05_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #6, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #6, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_05_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_05_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i32* null, i32** %data, align 8, !dbg !95
  %0 = load i32, i32* @staticFalse, align 4, !dbg !96
  %tobool = icmp ne i32 %0, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end3, !dbg !101

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !106
  %1 = bitcast i8* %call to i32*, !dbg !107
  store i32* %1, i32** %dataBuffer, align 8, !dbg !105
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  %cmp = icmp eq i32* %2, null, !dbg !110
  br i1 %cmp, label %if.then1, label %if.end, !dbg !111

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !114
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !115
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  store i32* %5, i32** %data, align 8, !dbg !119
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !124
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx5, align 4, !dbg !126
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  %6 = bitcast i32* %arraydecay6 to i8*, !dbg !127
  %7 = load i32*, i32** %data, align 8, !dbg !128
  %8 = bitcast i32* %7 to i8*, !dbg !127
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 400, i1 false), !dbg !127
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx7, align 4, !dbg !130
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !131
  call void @printWLine(i32* %arraydecay8), !dbg !132
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i32* null, i32** %data, align 8, !dbg !137
  %0 = load i32, i32* @staticTrue, align 4, !dbg !138
  %tobool = icmp ne i32 %0, 0, !dbg !138
  br i1 %tobool, label %if.then, label %if.end3, !dbg !140

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !141, metadata !DIExpression()), !dbg !144
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !145
  %1 = bitcast i8* %call to i32*, !dbg !146
  store i32* %1, i32** %dataBuffer, align 8, !dbg !144
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !147
  %cmp = icmp eq i32* %2, null, !dbg !149
  br i1 %cmp, label %if.then1, label %if.end, !dbg !150

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !151
  unreachable, !dbg !151

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !153
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !154
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !155
  store i32 0, i32* %arrayidx, align 4, !dbg !156
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !157
  store i32* %5, i32** %data, align 8, !dbg !158
  br label %if.end3, !dbg !159

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !160, metadata !DIExpression()), !dbg !162
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !164
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx5, align 4, !dbg !166
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  %6 = bitcast i32* %arraydecay6 to i8*, !dbg !167
  %7 = load i32*, i32** %data, align 8, !dbg !168
  %8 = bitcast i32* %7 to i8*, !dbg !167
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 400, i1 false), !dbg !167
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !169
  store i32 0, i32* %arrayidx7, align 4, !dbg !170
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !171
  call void @printWLine(i32* %arraydecay8), !dbg !172
  ret void, !dbg !173
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 32, type: !6)
!26 = !DILocation(line: 32, column: 15, scope: !22)
!27 = !DILocation(line: 33, column: 10, scope: !22)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 8, scope: !22)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !15, line: 37, type: !6)
!32 = distinct !DILexicalBlock(scope: !33, file: !15, line: 36, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 5)
!34 = !DILocation(line: 37, column: 23, scope: !32)
!35 = !DILocation(line: 37, column: 47, scope: !32)
!36 = !DILocation(line: 37, column: 36, scope: !32)
!37 = !DILocation(line: 38, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !15, line: 38, column: 17)
!39 = !DILocation(line: 38, column: 28, scope: !38)
!40 = !DILocation(line: 38, column: 17, scope: !32)
!41 = !DILocation(line: 38, column: 38, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 38, column: 37)
!43 = !DILocation(line: 39, column: 21, scope: !32)
!44 = !DILocation(line: 39, column: 13, scope: !32)
!45 = !DILocation(line: 40, column: 13, scope: !32)
!46 = !DILocation(line: 40, column: 31, scope: !32)
!47 = !DILocation(line: 42, column: 20, scope: !32)
!48 = !DILocation(line: 42, column: 31, scope: !32)
!49 = !DILocation(line: 42, column: 18, scope: !32)
!50 = !DILocation(line: 44, column: 5, scope: !33)
!51 = !DILocalVariable(name: "dest", scope: !52, file: !15, line: 46, type: !53)
!52 = distinct !DILexicalBlock(scope: !22, file: !15, line: 45, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 46, column: 17, scope: !52)
!57 = !DILocation(line: 47, column: 17, scope: !52)
!58 = !DILocation(line: 47, column: 9, scope: !52)
!59 = !DILocation(line: 48, column: 9, scope: !52)
!60 = !DILocation(line: 48, column: 21, scope: !52)
!61 = !DILocation(line: 50, column: 9, scope: !52)
!62 = !DILocation(line: 50, column: 23, scope: !52)
!63 = !DILocation(line: 52, column: 9, scope: !52)
!64 = !DILocation(line: 52, column: 21, scope: !52)
!65 = !DILocation(line: 53, column: 20, scope: !52)
!66 = !DILocation(line: 53, column: 9, scope: !52)
!67 = !DILocation(line: 57, column: 1, scope: !22)
!68 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_05_good", scope: !15, file: !15, line: 128, type: !23, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 130, column: 5, scope: !68)
!70 = !DILocation(line: 131, column: 5, scope: !68)
!71 = !DILocation(line: 132, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 144, type: !73, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{!9, !9, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !15, line: 144, type: !9)
!79 = !DILocation(line: 144, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !15, line: 144, type: !75)
!81 = !DILocation(line: 144, column: 27, scope: !72)
!82 = !DILocation(line: 147, column: 22, scope: !72)
!83 = !DILocation(line: 147, column: 12, scope: !72)
!84 = !DILocation(line: 147, column: 5, scope: !72)
!85 = !DILocation(line: 149, column: 5, scope: !72)
!86 = !DILocation(line: 150, column: 5, scope: !72)
!87 = !DILocation(line: 151, column: 5, scope: !72)
!88 = !DILocation(line: 154, column: 5, scope: !72)
!89 = !DILocation(line: 155, column: 5, scope: !72)
!90 = !DILocation(line: 156, column: 5, scope: !72)
!91 = !DILocation(line: 158, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 64, type: !23, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !15, line: 66, type: !6)
!94 = !DILocation(line: 66, column: 15, scope: !92)
!95 = !DILocation(line: 67, column: 10, scope: !92)
!96 = !DILocation(line: 68, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !15, line: 68, column: 8)
!98 = !DILocation(line: 68, column: 8, scope: !92)
!99 = !DILocation(line: 71, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !15, line: 69, column: 5)
!101 = !DILocation(line: 72, column: 5, scope: !100)
!102 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !15, line: 76, type: !6)
!103 = distinct !DILexicalBlock(scope: !104, file: !15, line: 75, column: 9)
!104 = distinct !DILexicalBlock(scope: !97, file: !15, line: 74, column: 5)
!105 = !DILocation(line: 76, column: 23, scope: !103)
!106 = !DILocation(line: 76, column: 47, scope: !103)
!107 = !DILocation(line: 76, column: 36, scope: !103)
!108 = !DILocation(line: 77, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !15, line: 77, column: 17)
!110 = !DILocation(line: 77, column: 28, scope: !109)
!111 = !DILocation(line: 77, column: 17, scope: !103)
!112 = !DILocation(line: 77, column: 38, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 77, column: 37)
!114 = !DILocation(line: 78, column: 21, scope: !103)
!115 = !DILocation(line: 78, column: 13, scope: !103)
!116 = !DILocation(line: 79, column: 13, scope: !103)
!117 = !DILocation(line: 79, column: 31, scope: !103)
!118 = !DILocation(line: 81, column: 20, scope: !103)
!119 = !DILocation(line: 81, column: 18, scope: !103)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !15, line: 85, type: !53)
!121 = distinct !DILexicalBlock(scope: !92, file: !15, line: 84, column: 5)
!122 = !DILocation(line: 85, column: 17, scope: !121)
!123 = !DILocation(line: 86, column: 17, scope: !121)
!124 = !DILocation(line: 86, column: 9, scope: !121)
!125 = !DILocation(line: 87, column: 9, scope: !121)
!126 = !DILocation(line: 87, column: 21, scope: !121)
!127 = !DILocation(line: 89, column: 9, scope: !121)
!128 = !DILocation(line: 89, column: 23, scope: !121)
!129 = !DILocation(line: 91, column: 9, scope: !121)
!130 = !DILocation(line: 91, column: 21, scope: !121)
!131 = !DILocation(line: 92, column: 20, scope: !121)
!132 = !DILocation(line: 92, column: 9, scope: !121)
!133 = !DILocation(line: 96, column: 1, scope: !92)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 99, type: !23, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!135 = !DILocalVariable(name: "data", scope: !134, file: !15, line: 101, type: !6)
!136 = !DILocation(line: 101, column: 15, scope: !134)
!137 = !DILocation(line: 102, column: 10, scope: !134)
!138 = !DILocation(line: 103, column: 8, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !15, line: 103, column: 8)
!140 = !DILocation(line: 103, column: 8, scope: !134)
!141 = !DILocalVariable(name: "dataBuffer", scope: !142, file: !15, line: 106, type: !6)
!142 = distinct !DILexicalBlock(scope: !143, file: !15, line: 105, column: 9)
!143 = distinct !DILexicalBlock(scope: !139, file: !15, line: 104, column: 5)
!144 = !DILocation(line: 106, column: 23, scope: !142)
!145 = !DILocation(line: 106, column: 47, scope: !142)
!146 = !DILocation(line: 106, column: 36, scope: !142)
!147 = !DILocation(line: 107, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !15, line: 107, column: 17)
!149 = !DILocation(line: 107, column: 28, scope: !148)
!150 = !DILocation(line: 107, column: 17, scope: !142)
!151 = !DILocation(line: 107, column: 38, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !15, line: 107, column: 37)
!153 = !DILocation(line: 108, column: 21, scope: !142)
!154 = !DILocation(line: 108, column: 13, scope: !142)
!155 = !DILocation(line: 109, column: 13, scope: !142)
!156 = !DILocation(line: 109, column: 31, scope: !142)
!157 = !DILocation(line: 111, column: 20, scope: !142)
!158 = !DILocation(line: 111, column: 18, scope: !142)
!159 = !DILocation(line: 113, column: 5, scope: !143)
!160 = !DILocalVariable(name: "dest", scope: !161, file: !15, line: 115, type: !53)
!161 = distinct !DILexicalBlock(scope: !134, file: !15, line: 114, column: 5)
!162 = !DILocation(line: 115, column: 17, scope: !161)
!163 = !DILocation(line: 116, column: 17, scope: !161)
!164 = !DILocation(line: 116, column: 9, scope: !161)
!165 = !DILocation(line: 117, column: 9, scope: !161)
!166 = !DILocation(line: 117, column: 21, scope: !161)
!167 = !DILocation(line: 119, column: 9, scope: !161)
!168 = !DILocation(line: 119, column: 23, scope: !161)
!169 = !DILocation(line: 121, column: 9, scope: !161)
!170 = !DILocation(line: 121, column: 21, scope: !161)
!171 = !DILocation(line: 122, column: 20, scope: !161)
!172 = !DILocation(line: 122, column: 9, scope: !161)
!173 = !DILocation(line: 126, column: 1, scope: !134)
