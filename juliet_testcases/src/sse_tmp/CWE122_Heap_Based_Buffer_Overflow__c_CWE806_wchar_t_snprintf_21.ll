; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_21.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !29
  %0 = bitcast i8* %call to i32*, !dbg !30
  store i32* %0, i32** %data, align 8, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  store i32 1, i32* @badStatic, align 4, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %call1 = call i32* @badSource(i32* %2), !dbg !40
  store i32* %call1, i32** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %4 = load i32*, i32** %data, align 8, !dbg !49
  %call2 = call i64 @wcslen(i32* %4) #9, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #7, !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %6), !dbg !54
  %7 = load i32*, i32** %data, align 8, !dbg !55
  %8 = bitcast i32* %7 to i8*, !dbg !55
  call void @free(i8* %8) #7, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i32, i32* @badStatic, align 4, !dbg !63
  %tobool = icmp ne i32 %0, 0, !dbg !63
  br i1 %tobool, label %if.then, label %if.end, !dbg !65

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !66
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #7, !dbg !68
  %2 = load i32*, i32** %data.addr, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !69
  store i32 0, i32* %arrayidx, align 4, !dbg !70
  br label %if.end, !dbg !71

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !72
  ret i32* %3, !dbg !73
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_21_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
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
  %call = call i64 @time(i64* null) #7, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #7, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_21_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_21_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !101
  %0 = bitcast i8* %call to i32*, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !103
  %1 = load i32*, i32** %data, align 8, !dbg !104
  %cmp = icmp eq i32* %1, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !110
  %2 = load i32*, i32** %data, align 8, !dbg !111
  %call1 = call i32* @goodG2B1Source(i32* %2), !dbg !112
  store i32* %call1, i32** %data, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !116
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !117
  %4 = load i32*, i32** %data, align 8, !dbg !118
  %call2 = call i64 @wcslen(i32* %4) #9, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #7, !dbg !121
  %6 = load i32*, i32** %data, align 8, !dbg !122
  call void @printWLine(i32* %6), !dbg !123
  %7 = load i32*, i32** %data, align 8, !dbg !124
  %8 = bitcast i32* %7 to i8*, !dbg !124
  call void @free(i8* %8) #7, !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !127 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !128, metadata !DIExpression()), !dbg !129
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !130
  %tobool = icmp ne i32 %0, 0, !dbg !130
  br i1 %tobool, label %if.then, label %if.else, !dbg !132

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !133
  br label %if.end, !dbg !135

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !136
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !138
  %2 = load i32*, i32** %data.addr, align 8, !dbg !139
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !139
  store i32 0, i32* %arrayidx, align 4, !dbg !140
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !141
  ret i32* %3, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !143 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !144, metadata !DIExpression()), !dbg !145
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !146
  %0 = bitcast i8* %call to i32*, !dbg !147
  store i32* %0, i32** %data, align 8, !dbg !148
  %1 = load i32*, i32** %data, align 8, !dbg !149
  %cmp = icmp eq i32* %1, null, !dbg !151
  br i1 %cmp, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !153
  unreachable, !dbg !153

if.end:                                           ; preds = %entry
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !155
  %2 = load i32*, i32** %data, align 8, !dbg !156
  %call1 = call i32* @goodG2B2Source(i32* %2), !dbg !157
  store i32* %call1, i32** %data, align 8, !dbg !158
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !159, metadata !DIExpression()), !dbg !161
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !161
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !162
  %4 = load i32*, i32** %data, align 8, !dbg !163
  %call2 = call i64 @wcslen(i32* %4) #9, !dbg !164
  %5 = load i32*, i32** %data, align 8, !dbg !165
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #7, !dbg !166
  %6 = load i32*, i32** %data, align 8, !dbg !167
  call void @printWLine(i32* %6), !dbg !168
  %7 = load i32*, i32** %data, align 8, !dbg !169
  %8 = bitcast i32* %7 to i8*, !dbg !169
  call void @free(i8* %8) #7, !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !172 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !173, metadata !DIExpression()), !dbg !174
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !175
  %tobool = icmp ne i32 %0, 0, !dbg !175
  br i1 %tobool, label %if.then, label %if.end, !dbg !177

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !178
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !180
  %2 = load i32*, i32** %data.addr, align 8, !dbg !181
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !181
  store i32 0, i32* %arrayidx, align 4, !dbg !182
  br label %if.end, !dbg !183

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !184
  ret i32* %3, !dbg !185
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 64, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_21.c", directory: "/root/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 65, type: !9, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_21_bad", scope: !15, file: !15, line: 43, type: !25, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 45, type: !6)
!28 = !DILocation(line: 45, column: 15, scope: !24)
!29 = !DILocation(line: 46, column: 23, scope: !24)
!30 = !DILocation(line: 46, column: 12, scope: !24)
!31 = !DILocation(line: 46, column: 10, scope: !24)
!32 = !DILocation(line: 47, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !24, file: !15, line: 47, column: 9)
!34 = !DILocation(line: 47, column: 14, scope: !33)
!35 = !DILocation(line: 47, column: 9, scope: !24)
!36 = !DILocation(line: 47, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !15, line: 47, column: 23)
!38 = !DILocation(line: 48, column: 15, scope: !24)
!39 = !DILocation(line: 49, column: 22, scope: !24)
!40 = !DILocation(line: 49, column: 12, scope: !24)
!41 = !DILocation(line: 49, column: 10, scope: !24)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !15, line: 51, type: !44)
!43 = distinct !DILexicalBlock(scope: !24, file: !15, line: 50, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 51, column: 17, scope: !43)
!48 = !DILocation(line: 53, column: 18, scope: !43)
!49 = !DILocation(line: 53, column: 31, scope: !43)
!50 = !DILocation(line: 53, column: 24, scope: !43)
!51 = !DILocation(line: 53, column: 45, scope: !43)
!52 = !DILocation(line: 53, column: 9, scope: !43)
!53 = !DILocation(line: 54, column: 20, scope: !43)
!54 = !DILocation(line: 54, column: 9, scope: !43)
!55 = !DILocation(line: 55, column: 14, scope: !43)
!56 = !DILocation(line: 55, column: 9, scope: !43)
!57 = !DILocation(line: 57, column: 1, scope: !24)
!58 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 32, type: !59, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!6, !6}
!61 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !15, line: 32, type: !6)
!62 = !DILocation(line: 32, column: 38, scope: !58)
!63 = !DILocation(line: 34, column: 8, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !15, line: 34, column: 8)
!65 = !DILocation(line: 34, column: 8, scope: !58)
!66 = !DILocation(line: 37, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !15, line: 35, column: 5)
!68 = !DILocation(line: 37, column: 9, scope: !67)
!69 = !DILocation(line: 38, column: 9, scope: !67)
!70 = !DILocation(line: 38, column: 21, scope: !67)
!71 = !DILocation(line: 39, column: 5, scope: !67)
!72 = !DILocation(line: 40, column: 12, scope: !58)
!73 = !DILocation(line: 40, column: 5, scope: !58)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_21_good", scope: !15, file: !15, line: 128, type: !25, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 130, column: 5, scope: !74)
!76 = !DILocation(line: 131, column: 5, scope: !74)
!77 = !DILocation(line: 132, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 144, type: !79, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!9, !9, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !15, line: 144, type: !9)
!85 = !DILocation(line: 144, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !15, line: 144, type: !81)
!87 = !DILocation(line: 144, column: 27, scope: !78)
!88 = !DILocation(line: 147, column: 22, scope: !78)
!89 = !DILocation(line: 147, column: 12, scope: !78)
!90 = !DILocation(line: 147, column: 5, scope: !78)
!91 = !DILocation(line: 149, column: 5, scope: !78)
!92 = !DILocation(line: 150, column: 5, scope: !78)
!93 = !DILocation(line: 151, column: 5, scope: !78)
!94 = !DILocation(line: 154, column: 5, scope: !78)
!95 = !DILocation(line: 155, column: 5, scope: !78)
!96 = !DILocation(line: 156, column: 5, scope: !78)
!97 = !DILocation(line: 158, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 84, type: !25, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !15, line: 86, type: !6)
!100 = !DILocation(line: 86, column: 15, scope: !98)
!101 = !DILocation(line: 87, column: 23, scope: !98)
!102 = !DILocation(line: 87, column: 12, scope: !98)
!103 = !DILocation(line: 87, column: 10, scope: !98)
!104 = !DILocation(line: 88, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !98, file: !15, line: 88, column: 9)
!106 = !DILocation(line: 88, column: 14, scope: !105)
!107 = !DILocation(line: 88, column: 9, scope: !98)
!108 = !DILocation(line: 88, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 88, column: 23)
!110 = !DILocation(line: 89, column: 20, scope: !98)
!111 = !DILocation(line: 90, column: 27, scope: !98)
!112 = !DILocation(line: 90, column: 12, scope: !98)
!113 = !DILocation(line: 90, column: 10, scope: !98)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !15, line: 92, type: !44)
!115 = distinct !DILexicalBlock(scope: !98, file: !15, line: 91, column: 5)
!116 = !DILocation(line: 92, column: 17, scope: !115)
!117 = !DILocation(line: 94, column: 18, scope: !115)
!118 = !DILocation(line: 94, column: 31, scope: !115)
!119 = !DILocation(line: 94, column: 24, scope: !115)
!120 = !DILocation(line: 94, column: 45, scope: !115)
!121 = !DILocation(line: 94, column: 9, scope: !115)
!122 = !DILocation(line: 95, column: 20, scope: !115)
!123 = !DILocation(line: 95, column: 9, scope: !115)
!124 = !DILocation(line: 96, column: 14, scope: !115)
!125 = !DILocation(line: 96, column: 9, scope: !115)
!126 = !DILocation(line: 98, column: 1, scope: !98)
!127 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 68, type: !59, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", arg: 1, scope: !127, file: !15, line: 68, type: !6)
!129 = !DILocation(line: 68, column: 43, scope: !127)
!130 = !DILocation(line: 70, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 70, column: 8)
!132 = !DILocation(line: 70, column: 8, scope: !127)
!133 = !DILocation(line: 73, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !15, line: 71, column: 5)
!135 = !DILocation(line: 74, column: 5, scope: !134)
!136 = !DILocation(line: 78, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !15, line: 76, column: 5)
!138 = !DILocation(line: 78, column: 9, scope: !137)
!139 = !DILocation(line: 79, column: 9, scope: !137)
!140 = !DILocation(line: 79, column: 20, scope: !137)
!141 = !DILocation(line: 81, column: 12, scope: !127)
!142 = !DILocation(line: 81, column: 5, scope: !127)
!143 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 112, type: !25, scopeLine: 113, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!144 = !DILocalVariable(name: "data", scope: !143, file: !15, line: 114, type: !6)
!145 = !DILocation(line: 114, column: 15, scope: !143)
!146 = !DILocation(line: 115, column: 23, scope: !143)
!147 = !DILocation(line: 115, column: 12, scope: !143)
!148 = !DILocation(line: 115, column: 10, scope: !143)
!149 = !DILocation(line: 116, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !15, line: 116, column: 9)
!151 = !DILocation(line: 116, column: 14, scope: !150)
!152 = !DILocation(line: 116, column: 9, scope: !143)
!153 = !DILocation(line: 116, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !15, line: 116, column: 23)
!155 = !DILocation(line: 117, column: 20, scope: !143)
!156 = !DILocation(line: 118, column: 27, scope: !143)
!157 = !DILocation(line: 118, column: 12, scope: !143)
!158 = !DILocation(line: 118, column: 10, scope: !143)
!159 = !DILocalVariable(name: "dest", scope: !160, file: !15, line: 120, type: !44)
!160 = distinct !DILexicalBlock(scope: !143, file: !15, line: 119, column: 5)
!161 = !DILocation(line: 120, column: 17, scope: !160)
!162 = !DILocation(line: 122, column: 18, scope: !160)
!163 = !DILocation(line: 122, column: 31, scope: !160)
!164 = !DILocation(line: 122, column: 24, scope: !160)
!165 = !DILocation(line: 122, column: 45, scope: !160)
!166 = !DILocation(line: 122, column: 9, scope: !160)
!167 = !DILocation(line: 123, column: 20, scope: !160)
!168 = !DILocation(line: 123, column: 9, scope: !160)
!169 = !DILocation(line: 124, column: 14, scope: !160)
!170 = !DILocation(line: 124, column: 9, scope: !160)
!171 = !DILocation(line: 126, column: 1, scope: !143)
!172 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 101, type: !59, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!173 = !DILocalVariable(name: "data", arg: 1, scope: !172, file: !15, line: 101, type: !6)
!174 = !DILocation(line: 101, column: 43, scope: !172)
!175 = !DILocation(line: 103, column: 8, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !15, line: 103, column: 8)
!177 = !DILocation(line: 103, column: 8, scope: !172)
!178 = !DILocation(line: 106, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !15, line: 104, column: 5)
!180 = !DILocation(line: 106, column: 9, scope: !179)
!181 = !DILocation(line: 107, column: 9, scope: !179)
!182 = !DILocation(line: 107, column: 20, scope: !179)
!183 = !DILocation(line: 108, column: 5, scope: !179)
!184 = !DILocation(line: 109, column: 12, scope: !172)
!185 = !DILocation(line: 109, column: 5, scope: !172)
