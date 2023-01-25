; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !40
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %1 = load i32*, i32** %data, align 8, !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call3 = call i32* @wcsncpy(i32* %1, i32* %arraydecay2, i64 99) #5, !dbg !46
  %2 = load i32*, i32** %data, align 8, !dbg !47
  %arrayidx4 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !47
  store i32 0, i32* %arrayidx4, align 4, !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %3), !dbg !50
  %4 = load i32*, i32** %data, align 8, !dbg !51
  %5 = bitcast i32* %4 to i8*, !dbg !51
  call void @free(i8* %5) #5, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @badStatic, align 4, !dbg !59
  %tobool = icmp ne i32 %0, 0, !dbg !59
  br i1 %tobool, label %if.then, label %if.end2, !dbg !61

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !62
  %1 = bitcast i8* %call to i32*, !dbg !64
  store i32* %1, i32** %data.addr, align 8, !dbg !65
  %2 = load i32*, i32** %data.addr, align 8, !dbg !66
  %cmp = icmp eq i32* %2, null, !dbg !68
  br i1 %cmp, label %if.then1, label %if.end, !dbg !69

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !70
  unreachable, !dbg !70

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !72
  store i32 0, i32* %arrayidx, align 4, !dbg !73
  br label %if.end2, !dbg !74

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i32*, i32** %data.addr, align 8, !dbg !75
  ret i32* %4, !dbg !76
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_21_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #5, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #5, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_21_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_21_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i32* null, i32** %data, align 8, !dbg !104
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !105
  %0 = load i32*, i32** %data, align 8, !dbg !106
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !107
  store i32* %call, i32** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !113
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %call3 = call i32* @wcsncpy(i32* %1, i32* %arraydecay2, i64 99) #5, !dbg !118
  %2 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx4 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !119
  store i32 0, i32* %arrayidx4, align 4, !dbg !120
  %3 = load i32*, i32** %data, align 8, !dbg !121
  call void @printWLine(i32* %3), !dbg !122
  %4 = load i32*, i32** %data, align 8, !dbg !123
  %5 = bitcast i32* %4 to i8*, !dbg !123
  call void @free(i8* %5) #5, !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !126 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !129
  %tobool = icmp ne i32 %0, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.else, !dbg !131

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !132
  br label %if.end2, !dbg !134

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !135
  %1 = bitcast i8* %call to i32*, !dbg !137
  store i32* %1, i32** %data.addr, align 8, !dbg !138
  %2 = load i32*, i32** %data.addr, align 8, !dbg !139
  %cmp = icmp eq i32* %2, null, !dbg !141
  br i1 %cmp, label %if.then1, label %if.end, !dbg !142

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data.addr, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !146
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i32*, i32** %data.addr, align 8, !dbg !147
  ret i32* %4, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !150, metadata !DIExpression()), !dbg !151
  store i32* null, i32** %data, align 8, !dbg !152
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !153
  %0 = load i32*, i32** %data, align 8, !dbg !154
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !155
  store i32* %call, i32** %data, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !157, metadata !DIExpression()), !dbg !159
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !160
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !161
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  %1 = load i32*, i32** %data, align 8, !dbg !164
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !165
  %call3 = call i32* @wcsncpy(i32* %1, i32* %arraydecay2, i64 99) #5, !dbg !166
  %2 = load i32*, i32** %data, align 8, !dbg !167
  %arrayidx4 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !167
  store i32 0, i32* %arrayidx4, align 4, !dbg !168
  %3 = load i32*, i32** %data, align 8, !dbg !169
  call void @printWLine(i32* %3), !dbg !170
  %4 = load i32*, i32** %data, align 8, !dbg !171
  %5 = bitcast i32* %4 to i8*, !dbg !171
  call void @free(i8* %5) #5, !dbg !172
  ret void, !dbg !173
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !174 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !175, metadata !DIExpression()), !dbg !176
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !177
  %tobool = icmp ne i32 %0, 0, !dbg !177
  br i1 %tobool, label %if.then, label %if.end2, !dbg !179

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !180
  %1 = bitcast i8* %call to i32*, !dbg !182
  store i32* %1, i32** %data.addr, align 8, !dbg !183
  %2 = load i32*, i32** %data.addr, align 8, !dbg !184
  %cmp = icmp eq i32* %2, null, !dbg !186
  br i1 %cmp, label %if.then1, label %if.end, !dbg !187

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !188
  unreachable, !dbg !188

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !190
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !190
  store i32 0, i32* %arrayidx, align 4, !dbg !191
  br label %if.end2, !dbg !192

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i32*, i32** %data.addr, align 8, !dbg !193
  ret i32* %4, !dbg !194
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 61, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 62, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_21_bad", scope: !15, file: !15, line: 38, type: !25, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 40, type: !7)
!28 = !DILocation(line: 40, column: 15, scope: !24)
!29 = !DILocation(line: 41, column: 10, scope: !24)
!30 = !DILocation(line: 42, column: 15, scope: !24)
!31 = !DILocation(line: 43, column: 22, scope: !24)
!32 = !DILocation(line: 43, column: 12, scope: !24)
!33 = !DILocation(line: 43, column: 10, scope: !24)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 45, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 44, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 45, column: 17, scope: !35)
!40 = !DILocation(line: 46, column: 17, scope: !35)
!41 = !DILocation(line: 46, column: 9, scope: !35)
!42 = !DILocation(line: 47, column: 9, scope: !35)
!43 = !DILocation(line: 47, column: 23, scope: !35)
!44 = !DILocation(line: 49, column: 17, scope: !35)
!45 = !DILocation(line: 49, column: 23, scope: !35)
!46 = !DILocation(line: 49, column: 9, scope: !35)
!47 = !DILocation(line: 50, column: 9, scope: !35)
!48 = !DILocation(line: 50, column: 21, scope: !35)
!49 = !DILocation(line: 51, column: 20, scope: !35)
!50 = !DILocation(line: 51, column: 9, scope: !35)
!51 = !DILocation(line: 52, column: 14, scope: !35)
!52 = !DILocation(line: 52, column: 9, scope: !35)
!53 = !DILocation(line: 54, column: 1, scope: !24)
!54 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !55, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7}
!57 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !15, line: 26, type: !7)
!58 = !DILocation(line: 26, column: 38, scope: !54)
!59 = !DILocation(line: 28, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !15, line: 28, column: 8)
!61 = !DILocation(line: 28, column: 8, scope: !54)
!62 = !DILocation(line: 31, column: 27, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !15, line: 29, column: 5)
!64 = !DILocation(line: 31, column: 16, scope: !63)
!65 = !DILocation(line: 31, column: 14, scope: !63)
!66 = !DILocation(line: 32, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 32, column: 13)
!68 = !DILocation(line: 32, column: 18, scope: !67)
!69 = !DILocation(line: 32, column: 13, scope: !63)
!70 = !DILocation(line: 32, column: 28, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 32, column: 27)
!72 = !DILocation(line: 33, column: 9, scope: !63)
!73 = !DILocation(line: 33, column: 17, scope: !63)
!74 = !DILocation(line: 34, column: 5, scope: !63)
!75 = !DILocation(line: 35, column: 12, scope: !54)
!76 = !DILocation(line: 35, column: 5, scope: !54)
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_21_good", scope: !15, file: !15, line: 131, type: !25, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 133, column: 5, scope: !77)
!79 = !DILocation(line: 134, column: 5, scope: !77)
!80 = !DILocation(line: 135, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 147, type: !82, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DISubroutineType(types: !83)
!83 = !{!10, !10, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !15, line: 147, type: !10)
!88 = !DILocation(line: 147, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !15, line: 147, type: !84)
!90 = !DILocation(line: 147, column: 27, scope: !81)
!91 = !DILocation(line: 150, column: 22, scope: !81)
!92 = !DILocation(line: 150, column: 12, scope: !81)
!93 = !DILocation(line: 150, column: 5, scope: !81)
!94 = !DILocation(line: 152, column: 5, scope: !81)
!95 = !DILocation(line: 153, column: 5, scope: !81)
!96 = !DILocation(line: 154, column: 5, scope: !81)
!97 = !DILocation(line: 157, column: 5, scope: !81)
!98 = !DILocation(line: 158, column: 5, scope: !81)
!99 = !DILocation(line: 159, column: 5, scope: !81)
!100 = !DILocation(line: 161, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 82, type: !25, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !15, line: 84, type: !7)
!103 = !DILocation(line: 84, column: 15, scope: !101)
!104 = !DILocation(line: 85, column: 10, scope: !101)
!105 = !DILocation(line: 86, column: 20, scope: !101)
!106 = !DILocation(line: 87, column: 27, scope: !101)
!107 = !DILocation(line: 87, column: 12, scope: !101)
!108 = !DILocation(line: 87, column: 10, scope: !101)
!109 = !DILocalVariable(name: "source", scope: !110, file: !15, line: 89, type: !36)
!110 = distinct !DILexicalBlock(scope: !101, file: !15, line: 88, column: 5)
!111 = !DILocation(line: 89, column: 17, scope: !110)
!112 = !DILocation(line: 90, column: 17, scope: !110)
!113 = !DILocation(line: 90, column: 9, scope: !110)
!114 = !DILocation(line: 91, column: 9, scope: !110)
!115 = !DILocation(line: 91, column: 23, scope: !110)
!116 = !DILocation(line: 93, column: 17, scope: !110)
!117 = !DILocation(line: 93, column: 23, scope: !110)
!118 = !DILocation(line: 93, column: 9, scope: !110)
!119 = !DILocation(line: 94, column: 9, scope: !110)
!120 = !DILocation(line: 94, column: 21, scope: !110)
!121 = !DILocation(line: 95, column: 20, scope: !110)
!122 = !DILocation(line: 95, column: 9, scope: !110)
!123 = !DILocation(line: 96, column: 14, scope: !110)
!124 = !DILocation(line: 96, column: 9, scope: !110)
!125 = !DILocation(line: 98, column: 1, scope: !101)
!126 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 65, type: !55, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!127 = !DILocalVariable(name: "data", arg: 1, scope: !126, file: !15, line: 65, type: !7)
!128 = !DILocation(line: 65, column: 43, scope: !126)
!129 = !DILocation(line: 67, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 67, column: 8)
!131 = !DILocation(line: 67, column: 8, scope: !126)
!132 = !DILocation(line: 70, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !15, line: 68, column: 5)
!134 = !DILocation(line: 71, column: 5, scope: !133)
!135 = !DILocation(line: 75, column: 27, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !15, line: 73, column: 5)
!137 = !DILocation(line: 75, column: 16, scope: !136)
!138 = !DILocation(line: 75, column: 14, scope: !136)
!139 = !DILocation(line: 76, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !15, line: 76, column: 13)
!141 = !DILocation(line: 76, column: 18, scope: !140)
!142 = !DILocation(line: 76, column: 13, scope: !136)
!143 = !DILocation(line: 76, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !15, line: 76, column: 27)
!145 = !DILocation(line: 77, column: 9, scope: !136)
!146 = !DILocation(line: 77, column: 17, scope: !136)
!147 = !DILocation(line: 79, column: 12, scope: !126)
!148 = !DILocation(line: 79, column: 5, scope: !126)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 113, type: !25, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DILocalVariable(name: "data", scope: !149, file: !15, line: 115, type: !7)
!151 = !DILocation(line: 115, column: 15, scope: !149)
!152 = !DILocation(line: 116, column: 10, scope: !149)
!153 = !DILocation(line: 117, column: 20, scope: !149)
!154 = !DILocation(line: 118, column: 27, scope: !149)
!155 = !DILocation(line: 118, column: 12, scope: !149)
!156 = !DILocation(line: 118, column: 10, scope: !149)
!157 = !DILocalVariable(name: "source", scope: !158, file: !15, line: 120, type: !36)
!158 = distinct !DILexicalBlock(scope: !149, file: !15, line: 119, column: 5)
!159 = !DILocation(line: 120, column: 17, scope: !158)
!160 = !DILocation(line: 121, column: 17, scope: !158)
!161 = !DILocation(line: 121, column: 9, scope: !158)
!162 = !DILocation(line: 122, column: 9, scope: !158)
!163 = !DILocation(line: 122, column: 23, scope: !158)
!164 = !DILocation(line: 124, column: 17, scope: !158)
!165 = !DILocation(line: 124, column: 23, scope: !158)
!166 = !DILocation(line: 124, column: 9, scope: !158)
!167 = !DILocation(line: 125, column: 9, scope: !158)
!168 = !DILocation(line: 125, column: 21, scope: !158)
!169 = !DILocation(line: 126, column: 20, scope: !158)
!170 = !DILocation(line: 126, column: 9, scope: !158)
!171 = !DILocation(line: 127, column: 14, scope: !158)
!172 = !DILocation(line: 127, column: 9, scope: !158)
!173 = !DILocation(line: 129, column: 1, scope: !149)
!174 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 101, type: !55, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!175 = !DILocalVariable(name: "data", arg: 1, scope: !174, file: !15, line: 101, type: !7)
!176 = !DILocation(line: 101, column: 43, scope: !174)
!177 = !DILocation(line: 103, column: 8, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !15, line: 103, column: 8)
!179 = !DILocation(line: 103, column: 8, scope: !174)
!180 = !DILocation(line: 106, column: 27, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !15, line: 104, column: 5)
!182 = !DILocation(line: 106, column: 16, scope: !181)
!183 = !DILocation(line: 106, column: 14, scope: !181)
!184 = !DILocation(line: 107, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !15, line: 107, column: 13)
!186 = !DILocation(line: 107, column: 18, scope: !185)
!187 = !DILocation(line: 107, column: 13, scope: !181)
!188 = !DILocation(line: 107, column: 28, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !15, line: 107, column: 27)
!190 = !DILocation(line: 108, column: 9, scope: !181)
!191 = !DILocation(line: 108, column: 17, scope: !181)
!192 = !DILocation(line: 109, column: 5, scope: !181)
!193 = !DILocation(line: 110, column: 12, scope: !174)
!194 = !DILocation(line: 110, column: 5, scope: !174)
