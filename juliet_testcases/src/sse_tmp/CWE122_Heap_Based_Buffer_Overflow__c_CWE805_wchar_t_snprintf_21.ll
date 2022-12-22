; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_21_bad() #0 !dbg !24 {
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
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %1, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay2) #5, !dbg !46
  %2 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %2), !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !49
  %4 = bitcast i32* %3 to i8*, !dbg !49
  call void @free(i8* %4) #5, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* @badStatic, align 4, !dbg !57
  %tobool = icmp ne i32 %0, 0, !dbg !57
  br i1 %tobool, label %if.then, label %if.end2, !dbg !59

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !60
  %1 = bitcast i8* %call to i32*, !dbg !62
  store i32* %1, i32** %data.addr, align 8, !dbg !63
  %2 = load i32*, i32** %data.addr, align 8, !dbg !64
  %cmp = icmp eq i32* %2, null, !dbg !66
  br i1 %cmp, label %if.then1, label %if.end, !dbg !67

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !68
  unreachable, !dbg !68

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !70
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !70
  store i32 0, i32* %arrayidx, align 4, !dbg !71
  br label %if.end2, !dbg !72

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i32*, i32** %data.addr, align 8, !dbg !73
  ret i32* %4, !dbg !74
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_21_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #5, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #5, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_21_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_21_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
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
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32* null, i32** %data, align 8, !dbg !102
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !103
  %0 = load i32*, i32** %data, align 8, !dbg !104
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !105
  store i32* %call, i32** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !111
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %1 = load i32*, i32** %data, align 8, !dbg !114
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %1, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay2) #5, !dbg !116
  %2 = load i32*, i32** %data, align 8, !dbg !117
  call void @printWLine(i32* %2), !dbg !118
  %3 = load i32*, i32** %data, align 8, !dbg !119
  %4 = bitcast i32* %3 to i8*, !dbg !119
  call void @free(i8* %4) #5, !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !122 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !125
  %tobool = icmp ne i32 %0, 0, !dbg !125
  br i1 %tobool, label %if.then, label %if.else, !dbg !127

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !128
  br label %if.end2, !dbg !130

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !131
  %1 = bitcast i8* %call to i32*, !dbg !133
  store i32* %1, i32** %data.addr, align 8, !dbg !134
  %2 = load i32*, i32** %data.addr, align 8, !dbg !135
  %cmp = icmp eq i32* %2, null, !dbg !137
  br i1 %cmp, label %if.then1, label %if.end, !dbg !138

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !139
  unreachable, !dbg !139

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data.addr, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !141
  store i32 0, i32* %arrayidx, align 4, !dbg !142
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i32*, i32** %data.addr, align 8, !dbg !143
  ret i32* %4, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !146, metadata !DIExpression()), !dbg !147
  store i32* null, i32** %data, align 8, !dbg !148
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !149
  %0 = load i32*, i32** %data, align 8, !dbg !150
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !151
  store i32* %call, i32** %data, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !153, metadata !DIExpression()), !dbg !155
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !156
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !157
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !158
  store i32 0, i32* %arrayidx, align 4, !dbg !159
  %1 = load i32*, i32** %data, align 8, !dbg !160
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !161
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %1, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay2) #5, !dbg !162
  %2 = load i32*, i32** %data, align 8, !dbg !163
  call void @printWLine(i32* %2), !dbg !164
  %3 = load i32*, i32** %data, align 8, !dbg !165
  %4 = bitcast i32* %3 to i8*, !dbg !165
  call void @free(i8* %4) #5, !dbg !166
  ret void, !dbg !167
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !168 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !169, metadata !DIExpression()), !dbg !170
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !171
  %tobool = icmp ne i32 %0, 0, !dbg !171
  br i1 %tobool, label %if.then, label %if.end2, !dbg !173

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !174
  %1 = bitcast i8* %call to i32*, !dbg !176
  store i32* %1, i32** %data.addr, align 8, !dbg !177
  %2 = load i32*, i32** %data.addr, align 8, !dbg !178
  %cmp = icmp eq i32* %2, null, !dbg !180
  br i1 %cmp, label %if.then1, label %if.end, !dbg !181

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !182
  unreachable, !dbg !182

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !184
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !184
  store i32 0, i32* %arrayidx, align 4, !dbg !185
  br label %if.end2, !dbg !186

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i32*, i32** %data.addr, align 8, !dbg !187
  ret i32* %4, !dbg !188
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
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 30, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 66, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_21.c", directory: "/root/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 67, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_21_bad", scope: !15, file: !15, line: 44, type: !25, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 46, type: !7)
!28 = !DILocation(line: 46, column: 15, scope: !24)
!29 = !DILocation(line: 47, column: 10, scope: !24)
!30 = !DILocation(line: 48, column: 15, scope: !24)
!31 = !DILocation(line: 49, column: 22, scope: !24)
!32 = !DILocation(line: 49, column: 12, scope: !24)
!33 = !DILocation(line: 49, column: 10, scope: !24)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 51, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 50, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 51, column: 17, scope: !35)
!40 = !DILocation(line: 52, column: 17, scope: !35)
!41 = !DILocation(line: 52, column: 9, scope: !35)
!42 = !DILocation(line: 53, column: 9, scope: !35)
!43 = !DILocation(line: 53, column: 23, scope: !35)
!44 = !DILocation(line: 55, column: 18, scope: !35)
!45 = !DILocation(line: 55, column: 36, scope: !35)
!46 = !DILocation(line: 55, column: 9, scope: !35)
!47 = !DILocation(line: 56, column: 20, scope: !35)
!48 = !DILocation(line: 56, column: 9, scope: !35)
!49 = !DILocation(line: 57, column: 14, scope: !35)
!50 = !DILocation(line: 57, column: 9, scope: !35)
!51 = !DILocation(line: 59, column: 1, scope: !24)
!52 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 32, type: !53, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!7, !7}
!55 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !15, line: 32, type: !7)
!56 = !DILocation(line: 32, column: 38, scope: !52)
!57 = !DILocation(line: 34, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !15, line: 34, column: 8)
!59 = !DILocation(line: 34, column: 8, scope: !52)
!60 = !DILocation(line: 37, column: 27, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !15, line: 35, column: 5)
!62 = !DILocation(line: 37, column: 16, scope: !61)
!63 = !DILocation(line: 37, column: 14, scope: !61)
!64 = !DILocation(line: 38, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !15, line: 38, column: 13)
!66 = !DILocation(line: 38, column: 18, scope: !65)
!67 = !DILocation(line: 38, column: 13, scope: !61)
!68 = !DILocation(line: 38, column: 28, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 38, column: 27)
!70 = !DILocation(line: 39, column: 9, scope: !61)
!71 = !DILocation(line: 39, column: 17, scope: !61)
!72 = !DILocation(line: 40, column: 5, scope: !61)
!73 = !DILocation(line: 41, column: 12, scope: !52)
!74 = !DILocation(line: 41, column: 5, scope: !52)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_21_good", scope: !15, file: !15, line: 134, type: !25, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocation(line: 136, column: 5, scope: !75)
!77 = !DILocation(line: 137, column: 5, scope: !75)
!78 = !DILocation(line: 138, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 150, type: !80, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!10, !10, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !15, line: 150, type: !10)
!86 = !DILocation(line: 150, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !15, line: 150, type: !82)
!88 = !DILocation(line: 150, column: 27, scope: !79)
!89 = !DILocation(line: 153, column: 22, scope: !79)
!90 = !DILocation(line: 153, column: 12, scope: !79)
!91 = !DILocation(line: 153, column: 5, scope: !79)
!92 = !DILocation(line: 155, column: 5, scope: !79)
!93 = !DILocation(line: 156, column: 5, scope: !79)
!94 = !DILocation(line: 157, column: 5, scope: !79)
!95 = !DILocation(line: 160, column: 5, scope: !79)
!96 = !DILocation(line: 161, column: 5, scope: !79)
!97 = !DILocation(line: 162, column: 5, scope: !79)
!98 = !DILocation(line: 164, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 87, type: !25, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 89, type: !7)
!101 = !DILocation(line: 89, column: 15, scope: !99)
!102 = !DILocation(line: 90, column: 10, scope: !99)
!103 = !DILocation(line: 91, column: 20, scope: !99)
!104 = !DILocation(line: 92, column: 27, scope: !99)
!105 = !DILocation(line: 92, column: 12, scope: !99)
!106 = !DILocation(line: 92, column: 10, scope: !99)
!107 = !DILocalVariable(name: "source", scope: !108, file: !15, line: 94, type: !36)
!108 = distinct !DILexicalBlock(scope: !99, file: !15, line: 93, column: 5)
!109 = !DILocation(line: 94, column: 17, scope: !108)
!110 = !DILocation(line: 95, column: 17, scope: !108)
!111 = !DILocation(line: 95, column: 9, scope: !108)
!112 = !DILocation(line: 96, column: 9, scope: !108)
!113 = !DILocation(line: 96, column: 23, scope: !108)
!114 = !DILocation(line: 98, column: 18, scope: !108)
!115 = !DILocation(line: 98, column: 36, scope: !108)
!116 = !DILocation(line: 98, column: 9, scope: !108)
!117 = !DILocation(line: 99, column: 20, scope: !108)
!118 = !DILocation(line: 99, column: 9, scope: !108)
!119 = !DILocation(line: 100, column: 14, scope: !108)
!120 = !DILocation(line: 100, column: 9, scope: !108)
!121 = !DILocation(line: 102, column: 1, scope: !99)
!122 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 70, type: !53, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DILocalVariable(name: "data", arg: 1, scope: !122, file: !15, line: 70, type: !7)
!124 = !DILocation(line: 70, column: 43, scope: !122)
!125 = !DILocation(line: 72, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 72, column: 8)
!127 = !DILocation(line: 72, column: 8, scope: !122)
!128 = !DILocation(line: 75, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !15, line: 73, column: 5)
!130 = !DILocation(line: 76, column: 5, scope: !129)
!131 = !DILocation(line: 80, column: 27, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !15, line: 78, column: 5)
!133 = !DILocation(line: 80, column: 16, scope: !132)
!134 = !DILocation(line: 80, column: 14, scope: !132)
!135 = !DILocation(line: 81, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 81, column: 13)
!137 = !DILocation(line: 81, column: 18, scope: !136)
!138 = !DILocation(line: 81, column: 13, scope: !132)
!139 = !DILocation(line: 81, column: 28, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !15, line: 81, column: 27)
!141 = !DILocation(line: 82, column: 9, scope: !132)
!142 = !DILocation(line: 82, column: 17, scope: !132)
!143 = !DILocation(line: 84, column: 12, scope: !122)
!144 = !DILocation(line: 84, column: 5, scope: !122)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 117, type: !25, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!146 = !DILocalVariable(name: "data", scope: !145, file: !15, line: 119, type: !7)
!147 = !DILocation(line: 119, column: 15, scope: !145)
!148 = !DILocation(line: 120, column: 10, scope: !145)
!149 = !DILocation(line: 121, column: 20, scope: !145)
!150 = !DILocation(line: 122, column: 27, scope: !145)
!151 = !DILocation(line: 122, column: 12, scope: !145)
!152 = !DILocation(line: 122, column: 10, scope: !145)
!153 = !DILocalVariable(name: "source", scope: !154, file: !15, line: 124, type: !36)
!154 = distinct !DILexicalBlock(scope: !145, file: !15, line: 123, column: 5)
!155 = !DILocation(line: 124, column: 17, scope: !154)
!156 = !DILocation(line: 125, column: 17, scope: !154)
!157 = !DILocation(line: 125, column: 9, scope: !154)
!158 = !DILocation(line: 126, column: 9, scope: !154)
!159 = !DILocation(line: 126, column: 23, scope: !154)
!160 = !DILocation(line: 128, column: 18, scope: !154)
!161 = !DILocation(line: 128, column: 36, scope: !154)
!162 = !DILocation(line: 128, column: 9, scope: !154)
!163 = !DILocation(line: 129, column: 20, scope: !154)
!164 = !DILocation(line: 129, column: 9, scope: !154)
!165 = !DILocation(line: 130, column: 14, scope: !154)
!166 = !DILocation(line: 130, column: 9, scope: !154)
!167 = !DILocation(line: 132, column: 1, scope: !145)
!168 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 105, type: !53, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!169 = !DILocalVariable(name: "data", arg: 1, scope: !168, file: !15, line: 105, type: !7)
!170 = !DILocation(line: 105, column: 43, scope: !168)
!171 = !DILocation(line: 107, column: 8, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !15, line: 107, column: 8)
!173 = !DILocation(line: 107, column: 8, scope: !168)
!174 = !DILocation(line: 110, column: 27, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !15, line: 108, column: 5)
!176 = !DILocation(line: 110, column: 16, scope: !175)
!177 = !DILocation(line: 110, column: 14, scope: !175)
!178 = !DILocation(line: 111, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !15, line: 111, column: 13)
!180 = !DILocation(line: 111, column: 18, scope: !179)
!181 = !DILocation(line: 111, column: 13, scope: !175)
!182 = !DILocation(line: 111, column: 28, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !15, line: 111, column: 27)
!184 = !DILocation(line: 112, column: 9, scope: !175)
!185 = !DILocation(line: 112, column: 17, scope: !175)
!186 = !DILocation(line: 113, column: 5, scope: !175)
!187 = !DILocation(line: 114, column: 12, scope: !168)
!188 = !DILocation(line: 114, column: 5, scope: !168)
