; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end4, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !34
  %1 = bitcast i8* %call to i32*, !dbg !35
  store i32* %1, i32** %dataBuffer, align 8, !dbg !33
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %cmp1 = icmp eq i32* %2, null, !dbg !38
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !39

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !43
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !46
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !47
  store i32* %add.ptr, i32** %data, align 8, !dbg !48
  br label %if.end4, !dbg !49

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !57
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx6, align 4, !dbg !59
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %6 = load i32*, i32** %data, align 8, !dbg !61
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call9 = call i64 @wcslen(i32* %arraydecay8) #8, !dbg !63
  %call10 = call i32* @wcsncpy(i32* %arraydecay7, i32* %6, i64 %call9) #6, !dbg !64
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !65
  store i32 0, i32* %arrayidx11, align 4, !dbg !66
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  call void @printWLine(i32* %arraydecay12), !dbg !68
  ret void, !dbg !69
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_07_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #6, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #6, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_07_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_07_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  %0 = load i32, i32* @staticFive, align 4, !dbg !98
  %cmp = icmp ne i32 %0, 5, !dbg !100
  br i1 %cmp, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  br label %if.end4, !dbg !104

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !109
  %1 = bitcast i8* %call to i32*, !dbg !110
  store i32* %1, i32** %dataBuffer, align 8, !dbg !108
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  %cmp1 = icmp eq i32* %2, null, !dbg !113
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !114

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !118
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  store i32* %5, i32** %data, align 8, !dbg !122
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !127
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx6, align 4, !dbg !129
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %6 = load i32*, i32** %data, align 8, !dbg !131
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  %call9 = call i64 @wcslen(i32* %arraydecay8) #8, !dbg !133
  %call10 = call i32* @wcsncpy(i32* %arraydecay7, i32* %6, i64 %call9) #6, !dbg !134
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx11, align 4, !dbg !136
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !137
  call void @printWLine(i32* %arraydecay12), !dbg !138
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !144
  %cmp = icmp eq i32 %0, 5, !dbg !146
  br i1 %cmp, label %if.then, label %if.end4, !dbg !147

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !148, metadata !DIExpression()), !dbg !151
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !152
  %1 = bitcast i8* %call to i32*, !dbg !153
  store i32* %1, i32** %dataBuffer, align 8, !dbg !151
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  %cmp1 = icmp eq i32* %2, null, !dbg !156
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !157

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !158
  unreachable, !dbg !158

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !160
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !161
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !162
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !164
  store i32* %5, i32** %data, align 8, !dbg !165
  br label %if.end4, !dbg !166

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !167, metadata !DIExpression()), !dbg !169
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !171
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !172
  store i32 0, i32* %arrayidx6, align 4, !dbg !173
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !174
  %6 = load i32*, i32** %data, align 8, !dbg !175
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !176
  %call9 = call i64 @wcslen(i32* %arraydecay8) #8, !dbg !177
  %call10 = call i32* @wcsncpy(i32* %arraydecay7, i32* %6, i64 %call9) #6, !dbg !178
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !179
  store i32 0, i32* %arrayidx11, align 4, !dbg !180
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !181
  call void @printWLine(i32* %arraydecay12), !dbg !182
  ret void, !dbg !183
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
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_07_bad", scope: !13, file: !13, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 15, scope: !20)
!25 = !DILocation(line: 32, column: 10, scope: !20)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 8, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !13, line: 36, type: !6)
!31 = distinct !DILexicalBlock(scope: !32, file: !13, line: 35, column: 9)
!32 = distinct !DILexicalBlock(scope: !27, file: !13, line: 34, column: 5)
!33 = !DILocation(line: 36, column: 23, scope: !31)
!34 = !DILocation(line: 36, column: 47, scope: !31)
!35 = !DILocation(line: 36, column: 36, scope: !31)
!36 = !DILocation(line: 37, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !13, line: 37, column: 17)
!38 = !DILocation(line: 37, column: 28, scope: !37)
!39 = !DILocation(line: 37, column: 17, scope: !31)
!40 = !DILocation(line: 37, column: 38, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !13, line: 37, column: 37)
!42 = !DILocation(line: 38, column: 21, scope: !31)
!43 = !DILocation(line: 38, column: 13, scope: !31)
!44 = !DILocation(line: 39, column: 13, scope: !31)
!45 = !DILocation(line: 39, column: 31, scope: !31)
!46 = !DILocation(line: 41, column: 20, scope: !31)
!47 = !DILocation(line: 41, column: 31, scope: !31)
!48 = !DILocation(line: 41, column: 18, scope: !31)
!49 = !DILocation(line: 43, column: 5, scope: !32)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !13, line: 45, type: !52)
!51 = distinct !DILexicalBlock(scope: !20, file: !13, line: 44, column: 5)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 45, column: 17, scope: !51)
!56 = !DILocation(line: 46, column: 17, scope: !51)
!57 = !DILocation(line: 46, column: 9, scope: !51)
!58 = !DILocation(line: 47, column: 9, scope: !51)
!59 = !DILocation(line: 47, column: 21, scope: !51)
!60 = !DILocation(line: 49, column: 17, scope: !51)
!61 = !DILocation(line: 49, column: 23, scope: !51)
!62 = !DILocation(line: 49, column: 36, scope: !51)
!63 = !DILocation(line: 49, column: 29, scope: !51)
!64 = !DILocation(line: 49, column: 9, scope: !51)
!65 = !DILocation(line: 51, column: 9, scope: !51)
!66 = !DILocation(line: 51, column: 21, scope: !51)
!67 = !DILocation(line: 52, column: 20, scope: !51)
!68 = !DILocation(line: 52, column: 9, scope: !51)
!69 = !DILocation(line: 56, column: 1, scope: !20)
!70 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_07_good", scope: !13, file: !13, line: 127, type: !21, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocation(line: 129, column: 5, scope: !70)
!72 = !DILocation(line: 130, column: 5, scope: !70)
!73 = !DILocation(line: 131, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 143, type: !75, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!9, !9, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !13, line: 143, type: !9)
!81 = !DILocation(line: 143, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !13, line: 143, type: !77)
!83 = !DILocation(line: 143, column: 27, scope: !74)
!84 = !DILocation(line: 146, column: 22, scope: !74)
!85 = !DILocation(line: 146, column: 12, scope: !74)
!86 = !DILocation(line: 146, column: 5, scope: !74)
!87 = !DILocation(line: 148, column: 5, scope: !74)
!88 = !DILocation(line: 149, column: 5, scope: !74)
!89 = !DILocation(line: 150, column: 5, scope: !74)
!90 = !DILocation(line: 153, column: 5, scope: !74)
!91 = !DILocation(line: 154, column: 5, scope: !74)
!92 = !DILocation(line: 155, column: 5, scope: !74)
!93 = !DILocation(line: 157, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 63, type: !21, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "data", scope: !94, file: !13, line: 65, type: !6)
!96 = !DILocation(line: 65, column: 15, scope: !94)
!97 = !DILocation(line: 66, column: 10, scope: !94)
!98 = !DILocation(line: 67, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !13, line: 67, column: 8)
!100 = !DILocation(line: 67, column: 18, scope: !99)
!101 = !DILocation(line: 67, column: 8, scope: !94)
!102 = !DILocation(line: 70, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !13, line: 68, column: 5)
!104 = !DILocation(line: 71, column: 5, scope: !103)
!105 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !13, line: 75, type: !6)
!106 = distinct !DILexicalBlock(scope: !107, file: !13, line: 74, column: 9)
!107 = distinct !DILexicalBlock(scope: !99, file: !13, line: 73, column: 5)
!108 = !DILocation(line: 75, column: 23, scope: !106)
!109 = !DILocation(line: 75, column: 47, scope: !106)
!110 = !DILocation(line: 75, column: 36, scope: !106)
!111 = !DILocation(line: 76, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !13, line: 76, column: 17)
!113 = !DILocation(line: 76, column: 28, scope: !112)
!114 = !DILocation(line: 76, column: 17, scope: !106)
!115 = !DILocation(line: 76, column: 38, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !13, line: 76, column: 37)
!117 = !DILocation(line: 77, column: 21, scope: !106)
!118 = !DILocation(line: 77, column: 13, scope: !106)
!119 = !DILocation(line: 78, column: 13, scope: !106)
!120 = !DILocation(line: 78, column: 31, scope: !106)
!121 = !DILocation(line: 80, column: 20, scope: !106)
!122 = !DILocation(line: 80, column: 18, scope: !106)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !13, line: 84, type: !52)
!124 = distinct !DILexicalBlock(scope: !94, file: !13, line: 83, column: 5)
!125 = !DILocation(line: 84, column: 17, scope: !124)
!126 = !DILocation(line: 85, column: 17, scope: !124)
!127 = !DILocation(line: 85, column: 9, scope: !124)
!128 = !DILocation(line: 86, column: 9, scope: !124)
!129 = !DILocation(line: 86, column: 21, scope: !124)
!130 = !DILocation(line: 88, column: 17, scope: !124)
!131 = !DILocation(line: 88, column: 23, scope: !124)
!132 = !DILocation(line: 88, column: 36, scope: !124)
!133 = !DILocation(line: 88, column: 29, scope: !124)
!134 = !DILocation(line: 88, column: 9, scope: !124)
!135 = !DILocation(line: 90, column: 9, scope: !124)
!136 = !DILocation(line: 90, column: 21, scope: !124)
!137 = !DILocation(line: 91, column: 20, scope: !124)
!138 = !DILocation(line: 91, column: 9, scope: !124)
!139 = !DILocation(line: 95, column: 1, scope: !94)
!140 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 98, type: !21, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!141 = !DILocalVariable(name: "data", scope: !140, file: !13, line: 100, type: !6)
!142 = !DILocation(line: 100, column: 15, scope: !140)
!143 = !DILocation(line: 101, column: 10, scope: !140)
!144 = !DILocation(line: 102, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !13, line: 102, column: 8)
!146 = !DILocation(line: 102, column: 18, scope: !145)
!147 = !DILocation(line: 102, column: 8, scope: !140)
!148 = !DILocalVariable(name: "dataBuffer", scope: !149, file: !13, line: 105, type: !6)
!149 = distinct !DILexicalBlock(scope: !150, file: !13, line: 104, column: 9)
!150 = distinct !DILexicalBlock(scope: !145, file: !13, line: 103, column: 5)
!151 = !DILocation(line: 105, column: 23, scope: !149)
!152 = !DILocation(line: 105, column: 47, scope: !149)
!153 = !DILocation(line: 105, column: 36, scope: !149)
!154 = !DILocation(line: 106, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !13, line: 106, column: 17)
!156 = !DILocation(line: 106, column: 28, scope: !155)
!157 = !DILocation(line: 106, column: 17, scope: !149)
!158 = !DILocation(line: 106, column: 38, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !13, line: 106, column: 37)
!160 = !DILocation(line: 107, column: 21, scope: !149)
!161 = !DILocation(line: 107, column: 13, scope: !149)
!162 = !DILocation(line: 108, column: 13, scope: !149)
!163 = !DILocation(line: 108, column: 31, scope: !149)
!164 = !DILocation(line: 110, column: 20, scope: !149)
!165 = !DILocation(line: 110, column: 18, scope: !149)
!166 = !DILocation(line: 112, column: 5, scope: !150)
!167 = !DILocalVariable(name: "dest", scope: !168, file: !13, line: 114, type: !52)
!168 = distinct !DILexicalBlock(scope: !140, file: !13, line: 113, column: 5)
!169 = !DILocation(line: 114, column: 17, scope: !168)
!170 = !DILocation(line: 115, column: 17, scope: !168)
!171 = !DILocation(line: 115, column: 9, scope: !168)
!172 = !DILocation(line: 116, column: 9, scope: !168)
!173 = !DILocation(line: 116, column: 21, scope: !168)
!174 = !DILocation(line: 118, column: 17, scope: !168)
!175 = !DILocation(line: 118, column: 23, scope: !168)
!176 = !DILocation(line: 118, column: 36, scope: !168)
!177 = !DILocation(line: 118, column: 29, scope: !168)
!178 = !DILocation(line: 118, column: 9, scope: !168)
!179 = !DILocation(line: 120, column: 9, scope: !168)
!180 = !DILocation(line: 120, column: 21, scope: !168)
!181 = !DILocation(line: 121, column: 20, scope: !168)
!182 = !DILocation(line: 121, column: 9, scope: !168)
!183 = !DILocation(line: 125, column: 1, scope: !140)
