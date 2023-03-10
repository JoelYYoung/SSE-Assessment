; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_05.c"
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_05_bad() #0 !dbg !22 {
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
  %6 = load i32*, i32** %data, align 8, !dbg !62
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !64
  %call9 = call i32* @wcsncpy(i32* %arraydecay6, i32* %6, i64 %call8) #6, !dbg !65
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !66
  store i32 0, i32* %arrayidx10, align 4, !dbg !67
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !68
  call void @printWLine(i32* %arraydecay11), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_05_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
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
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_05_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_05_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i32* null, i32** %data, align 8, !dbg !98
  %0 = load i32, i32* @staticFalse, align 4, !dbg !99
  %tobool = icmp ne i32 %0, 0, !dbg !99
  br i1 %tobool, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  br label %if.end3, !dbg !104

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !109
  %1 = bitcast i8* %call to i32*, !dbg !110
  store i32* %1, i32** %dataBuffer, align 8, !dbg !108
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  %cmp = icmp eq i32* %2, null, !dbg !113
  br i1 %cmp, label %if.then1, label %if.end, !dbg !114

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !118
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  store i32* %5, i32** %data, align 8, !dbg !122
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !127
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx5, align 4, !dbg !129
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %6 = load i32*, i32** %data, align 8, !dbg !131
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !133
  %call9 = call i32* @wcsncpy(i32* %arraydecay6, i32* %6, i64 %call8) #6, !dbg !134
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx10, align 4, !dbg !136
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !137
  call void @printWLine(i32* %arraydecay11), !dbg !138
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !140 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !141, metadata !DIExpression()), !dbg !142
  store i32* null, i32** %data, align 8, !dbg !143
  %0 = load i32, i32* @staticTrue, align 4, !dbg !144
  %tobool = icmp ne i32 %0, 0, !dbg !144
  br i1 %tobool, label %if.then, label %if.end3, !dbg !146

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !147, metadata !DIExpression()), !dbg !150
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !151
  %1 = bitcast i8* %call to i32*, !dbg !152
  store i32* %1, i32** %dataBuffer, align 8, !dbg !150
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !153
  %cmp = icmp eq i32* %2, null, !dbg !155
  br i1 %cmp, label %if.then1, label %if.end, !dbg !156

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !157
  unreachable, !dbg !157

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !159
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !160
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !161
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !161
  store i32 0, i32* %arrayidx, align 4, !dbg !162
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !163
  store i32* %5, i32** %data, align 8, !dbg !164
  br label %if.end3, !dbg !165

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !166, metadata !DIExpression()), !dbg !168
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !169
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !170
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !171
  store i32 0, i32* %arrayidx5, align 4, !dbg !172
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !173
  %6 = load i32*, i32** %data, align 8, !dbg !174
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !175
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !176
  %call9 = call i32* @wcsncpy(i32* %arraydecay6, i32* %6, i64 %call8) #6, !dbg !177
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !178
  store i32 0, i32* %arrayidx10, align 4, !dbg !179
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !180
  call void @printWLine(i32* %arraydecay11), !dbg !181
  ret void, !dbg !182
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!61 = !DILocation(line: 50, column: 17, scope: !52)
!62 = !DILocation(line: 50, column: 23, scope: !52)
!63 = !DILocation(line: 50, column: 36, scope: !52)
!64 = !DILocation(line: 50, column: 29, scope: !52)
!65 = !DILocation(line: 50, column: 9, scope: !52)
!66 = !DILocation(line: 52, column: 9, scope: !52)
!67 = !DILocation(line: 52, column: 21, scope: !52)
!68 = !DILocation(line: 53, column: 20, scope: !52)
!69 = !DILocation(line: 53, column: 9, scope: !52)
!70 = !DILocation(line: 57, column: 1, scope: !22)
!71 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_05_good", scope: !15, file: !15, line: 128, type: !23, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocation(line: 130, column: 5, scope: !71)
!73 = !DILocation(line: 131, column: 5, scope: !71)
!74 = !DILocation(line: 132, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 144, type: !76, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{!9, !9, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !15, line: 144, type: !9)
!82 = !DILocation(line: 144, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !15, line: 144, type: !78)
!84 = !DILocation(line: 144, column: 27, scope: !75)
!85 = !DILocation(line: 147, column: 22, scope: !75)
!86 = !DILocation(line: 147, column: 12, scope: !75)
!87 = !DILocation(line: 147, column: 5, scope: !75)
!88 = !DILocation(line: 149, column: 5, scope: !75)
!89 = !DILocation(line: 150, column: 5, scope: !75)
!90 = !DILocation(line: 151, column: 5, scope: !75)
!91 = !DILocation(line: 154, column: 5, scope: !75)
!92 = !DILocation(line: 155, column: 5, scope: !75)
!93 = !DILocation(line: 156, column: 5, scope: !75)
!94 = !DILocation(line: 158, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 64, type: !23, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !15, line: 66, type: !6)
!97 = !DILocation(line: 66, column: 15, scope: !95)
!98 = !DILocation(line: 67, column: 10, scope: !95)
!99 = !DILocation(line: 68, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !15, line: 68, column: 8)
!101 = !DILocation(line: 68, column: 8, scope: !95)
!102 = !DILocation(line: 71, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !15, line: 69, column: 5)
!104 = !DILocation(line: 72, column: 5, scope: !103)
!105 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !15, line: 76, type: !6)
!106 = distinct !DILexicalBlock(scope: !107, file: !15, line: 75, column: 9)
!107 = distinct !DILexicalBlock(scope: !100, file: !15, line: 74, column: 5)
!108 = !DILocation(line: 76, column: 23, scope: !106)
!109 = !DILocation(line: 76, column: 47, scope: !106)
!110 = !DILocation(line: 76, column: 36, scope: !106)
!111 = !DILocation(line: 77, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !15, line: 77, column: 17)
!113 = !DILocation(line: 77, column: 28, scope: !112)
!114 = !DILocation(line: 77, column: 17, scope: !106)
!115 = !DILocation(line: 77, column: 38, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 77, column: 37)
!117 = !DILocation(line: 78, column: 21, scope: !106)
!118 = !DILocation(line: 78, column: 13, scope: !106)
!119 = !DILocation(line: 79, column: 13, scope: !106)
!120 = !DILocation(line: 79, column: 31, scope: !106)
!121 = !DILocation(line: 81, column: 20, scope: !106)
!122 = !DILocation(line: 81, column: 18, scope: !106)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !15, line: 85, type: !53)
!124 = distinct !DILexicalBlock(scope: !95, file: !15, line: 84, column: 5)
!125 = !DILocation(line: 85, column: 17, scope: !124)
!126 = !DILocation(line: 86, column: 17, scope: !124)
!127 = !DILocation(line: 86, column: 9, scope: !124)
!128 = !DILocation(line: 87, column: 9, scope: !124)
!129 = !DILocation(line: 87, column: 21, scope: !124)
!130 = !DILocation(line: 89, column: 17, scope: !124)
!131 = !DILocation(line: 89, column: 23, scope: !124)
!132 = !DILocation(line: 89, column: 36, scope: !124)
!133 = !DILocation(line: 89, column: 29, scope: !124)
!134 = !DILocation(line: 89, column: 9, scope: !124)
!135 = !DILocation(line: 91, column: 9, scope: !124)
!136 = !DILocation(line: 91, column: 21, scope: !124)
!137 = !DILocation(line: 92, column: 20, scope: !124)
!138 = !DILocation(line: 92, column: 9, scope: !124)
!139 = !DILocation(line: 96, column: 1, scope: !95)
!140 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 99, type: !23, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!141 = !DILocalVariable(name: "data", scope: !140, file: !15, line: 101, type: !6)
!142 = !DILocation(line: 101, column: 15, scope: !140)
!143 = !DILocation(line: 102, column: 10, scope: !140)
!144 = !DILocation(line: 103, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !15, line: 103, column: 8)
!146 = !DILocation(line: 103, column: 8, scope: !140)
!147 = !DILocalVariable(name: "dataBuffer", scope: !148, file: !15, line: 106, type: !6)
!148 = distinct !DILexicalBlock(scope: !149, file: !15, line: 105, column: 9)
!149 = distinct !DILexicalBlock(scope: !145, file: !15, line: 104, column: 5)
!150 = !DILocation(line: 106, column: 23, scope: !148)
!151 = !DILocation(line: 106, column: 47, scope: !148)
!152 = !DILocation(line: 106, column: 36, scope: !148)
!153 = !DILocation(line: 107, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !148, file: !15, line: 107, column: 17)
!155 = !DILocation(line: 107, column: 28, scope: !154)
!156 = !DILocation(line: 107, column: 17, scope: !148)
!157 = !DILocation(line: 107, column: 38, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 107, column: 37)
!159 = !DILocation(line: 108, column: 21, scope: !148)
!160 = !DILocation(line: 108, column: 13, scope: !148)
!161 = !DILocation(line: 109, column: 13, scope: !148)
!162 = !DILocation(line: 109, column: 31, scope: !148)
!163 = !DILocation(line: 111, column: 20, scope: !148)
!164 = !DILocation(line: 111, column: 18, scope: !148)
!165 = !DILocation(line: 113, column: 5, scope: !149)
!166 = !DILocalVariable(name: "dest", scope: !167, file: !15, line: 115, type: !53)
!167 = distinct !DILexicalBlock(scope: !140, file: !15, line: 114, column: 5)
!168 = !DILocation(line: 115, column: 17, scope: !167)
!169 = !DILocation(line: 116, column: 17, scope: !167)
!170 = !DILocation(line: 116, column: 9, scope: !167)
!171 = !DILocation(line: 117, column: 9, scope: !167)
!172 = !DILocation(line: 117, column: 21, scope: !167)
!173 = !DILocation(line: 119, column: 17, scope: !167)
!174 = !DILocation(line: 119, column: 23, scope: !167)
!175 = !DILocation(line: 119, column: 36, scope: !167)
!176 = !DILocation(line: 119, column: 29, scope: !167)
!177 = !DILocation(line: 119, column: 9, scope: !167)
!178 = !DILocation(line: 121, column: 9, scope: !167)
!179 = !DILocation(line: 121, column: 21, scope: !167)
!180 = !DILocation(line: 122, column: 20, scope: !167)
!181 = !DILocation(line: 122, column: 9, scope: !167)
!182 = !DILocation(line: 126, column: 1, scope: !140)
