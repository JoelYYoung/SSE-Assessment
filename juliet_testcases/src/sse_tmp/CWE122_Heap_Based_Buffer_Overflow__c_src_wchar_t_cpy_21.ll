; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_21.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !29
  %0 = bitcast i8* %call to i32*, !dbg !30
  store i32* %0, i32** %data, align 8, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !36
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
  %call2 = call i32* @wcscpy(i32* %arraydecay, i32* %4) #6, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %5), !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  %7 = bitcast i32* %6 to i8*, !dbg !53
  call void @free(i8* %7) #6, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !56 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32, i32* @badStatic, align 4, !dbg !61
  %tobool = icmp ne i32 %0, 0, !dbg !61
  br i1 %tobool, label %if.then, label %if.end, !dbg !63

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !64
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #6, !dbg !66
  %2 = load i32*, i32** %data.addr, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !67
  store i32 0, i32* %arrayidx, align 4, !dbg !68
  br label %if.end, !dbg !69

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !70
  ret i32* %3, !dbg !71
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_21_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #6, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #6, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_21_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_21_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !99
  %0 = bitcast i8* %call to i32*, !dbg !100
  store i32* %0, i32** %data, align 8, !dbg !101
  %1 = load i32*, i32** %data, align 8, !dbg !102
  %cmp = icmp eq i32* %1, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !108
  %2 = load i32*, i32** %data, align 8, !dbg !109
  %call1 = call i32* @goodG2B1Source(i32* %2), !dbg !110
  store i32* %call1, i32** %data, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !114
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !115
  %4 = load i32*, i32** %data, align 8, !dbg !116
  %call2 = call i32* @wcscpy(i32* %arraydecay, i32* %4) #6, !dbg !117
  %5 = load i32*, i32** %data, align 8, !dbg !118
  call void @printWLine(i32* %5), !dbg !119
  %6 = load i32*, i32** %data, align 8, !dbg !120
  %7 = bitcast i32* %6 to i8*, !dbg !120
  call void @free(i8* %7) #6, !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !123 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !126
  %tobool = icmp ne i32 %0, 0, !dbg !126
  br i1 %tobool, label %if.then, label %if.else, !dbg !128

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !129
  br label %if.end, !dbg !131

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !132
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !134
  %2 = load i32*, i32** %data.addr, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !137
  ret i32* %3, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !142
  %0 = bitcast i8* %call to i32*, !dbg !143
  store i32* %0, i32** %data, align 8, !dbg !144
  %1 = load i32*, i32** %data, align 8, !dbg !145
  %cmp = icmp eq i32* %1, null, !dbg !147
  br i1 %cmp, label %if.then, label %if.end, !dbg !148

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !149
  unreachable, !dbg !149

if.end:                                           ; preds = %entry
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !151
  %2 = load i32*, i32** %data, align 8, !dbg !152
  %call1 = call i32* @goodG2B2Source(i32* %2), !dbg !153
  store i32* %call1, i32** %data, align 8, !dbg !154
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !155, metadata !DIExpression()), !dbg !157
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !157
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !158
  %4 = load i32*, i32** %data, align 8, !dbg !159
  %call2 = call i32* @wcscpy(i32* %arraydecay, i32* %4) #6, !dbg !160
  %5 = load i32*, i32** %data, align 8, !dbg !161
  call void @printWLine(i32* %5), !dbg !162
  %6 = load i32*, i32** %data, align 8, !dbg !163
  %7 = bitcast i32* %6 to i8*, !dbg !163
  call void @free(i8* %7) #6, !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !166 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !167, metadata !DIExpression()), !dbg !168
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !169
  %tobool = icmp ne i32 %0, 0, !dbg !169
  br i1 %tobool, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !172
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !174
  %2 = load i32*, i32** %data.addr, align 8, !dbg !175
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !175
  store i32 0, i32* %arrayidx, align 4, !dbg !176
  br label %if.end, !dbg !177

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !178
  ret i32* %3, !dbg !179
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_21.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 58, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_21.c", directory: "/root/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 59, type: !9, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_21_bad", scope: !15, file: !15, line: 37, type: !25, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 39, type: !6)
!28 = !DILocation(line: 39, column: 15, scope: !24)
!29 = !DILocation(line: 40, column: 23, scope: !24)
!30 = !DILocation(line: 40, column: 12, scope: !24)
!31 = !DILocation(line: 40, column: 10, scope: !24)
!32 = !DILocation(line: 41, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !24, file: !15, line: 41, column: 9)
!34 = !DILocation(line: 41, column: 14, scope: !33)
!35 = !DILocation(line: 41, column: 9, scope: !24)
!36 = !DILocation(line: 41, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !15, line: 41, column: 23)
!38 = !DILocation(line: 42, column: 15, scope: !24)
!39 = !DILocation(line: 43, column: 22, scope: !24)
!40 = !DILocation(line: 43, column: 12, scope: !24)
!41 = !DILocation(line: 43, column: 10, scope: !24)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !15, line: 45, type: !44)
!43 = distinct !DILexicalBlock(scope: !24, file: !15, line: 44, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 45, column: 17, scope: !43)
!48 = !DILocation(line: 47, column: 16, scope: !43)
!49 = !DILocation(line: 47, column: 22, scope: !43)
!50 = !DILocation(line: 47, column: 9, scope: !43)
!51 = !DILocation(line: 48, column: 20, scope: !43)
!52 = !DILocation(line: 48, column: 9, scope: !43)
!53 = !DILocation(line: 49, column: 14, scope: !43)
!54 = !DILocation(line: 49, column: 9, scope: !43)
!55 = !DILocation(line: 51, column: 1, scope: !24)
!56 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !57, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!6, !6}
!59 = !DILocalVariable(name: "data", arg: 1, scope: !56, file: !15, line: 26, type: !6)
!60 = !DILocation(line: 26, column: 38, scope: !56)
!61 = !DILocation(line: 28, column: 8, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !15, line: 28, column: 8)
!63 = !DILocation(line: 28, column: 8, scope: !56)
!64 = !DILocation(line: 31, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !15, line: 29, column: 5)
!66 = !DILocation(line: 31, column: 9, scope: !65)
!67 = !DILocation(line: 32, column: 9, scope: !65)
!68 = !DILocation(line: 32, column: 21, scope: !65)
!69 = !DILocation(line: 33, column: 5, scope: !65)
!70 = !DILocation(line: 34, column: 12, scope: !56)
!71 = !DILocation(line: 34, column: 5, scope: !56)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_21_good", scope: !15, file: !15, line: 122, type: !25, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 124, column: 5, scope: !72)
!74 = !DILocation(line: 125, column: 5, scope: !72)
!75 = !DILocation(line: 126, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 138, type: !77, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DISubroutineType(types: !78)
!78 = !{!9, !9, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !15, line: 138, type: !9)
!83 = !DILocation(line: 138, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !15, line: 138, type: !79)
!85 = !DILocation(line: 138, column: 27, scope: !76)
!86 = !DILocation(line: 141, column: 22, scope: !76)
!87 = !DILocation(line: 141, column: 12, scope: !76)
!88 = !DILocation(line: 141, column: 5, scope: !76)
!89 = !DILocation(line: 143, column: 5, scope: !76)
!90 = !DILocation(line: 144, column: 5, scope: !76)
!91 = !DILocation(line: 145, column: 5, scope: !76)
!92 = !DILocation(line: 148, column: 5, scope: !76)
!93 = !DILocation(line: 149, column: 5, scope: !76)
!94 = !DILocation(line: 150, column: 5, scope: !76)
!95 = !DILocation(line: 152, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 78, type: !25, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 80, type: !6)
!98 = !DILocation(line: 80, column: 15, scope: !96)
!99 = !DILocation(line: 81, column: 23, scope: !96)
!100 = !DILocation(line: 81, column: 12, scope: !96)
!101 = !DILocation(line: 81, column: 10, scope: !96)
!102 = !DILocation(line: 82, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !15, line: 82, column: 9)
!104 = !DILocation(line: 82, column: 14, scope: !103)
!105 = !DILocation(line: 82, column: 9, scope: !96)
!106 = !DILocation(line: 82, column: 24, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 82, column: 23)
!108 = !DILocation(line: 83, column: 20, scope: !96)
!109 = !DILocation(line: 84, column: 27, scope: !96)
!110 = !DILocation(line: 84, column: 12, scope: !96)
!111 = !DILocation(line: 84, column: 10, scope: !96)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !15, line: 86, type: !44)
!113 = distinct !DILexicalBlock(scope: !96, file: !15, line: 85, column: 5)
!114 = !DILocation(line: 86, column: 17, scope: !113)
!115 = !DILocation(line: 88, column: 16, scope: !113)
!116 = !DILocation(line: 88, column: 22, scope: !113)
!117 = !DILocation(line: 88, column: 9, scope: !113)
!118 = !DILocation(line: 89, column: 20, scope: !113)
!119 = !DILocation(line: 89, column: 9, scope: !113)
!120 = !DILocation(line: 90, column: 14, scope: !113)
!121 = !DILocation(line: 90, column: 9, scope: !113)
!122 = !DILocation(line: 92, column: 1, scope: !96)
!123 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 62, type: !57, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", arg: 1, scope: !123, file: !15, line: 62, type: !6)
!125 = !DILocation(line: 62, column: 43, scope: !123)
!126 = !DILocation(line: 64, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 64, column: 8)
!128 = !DILocation(line: 64, column: 8, scope: !123)
!129 = !DILocation(line: 67, column: 9, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !15, line: 65, column: 5)
!131 = !DILocation(line: 68, column: 5, scope: !130)
!132 = !DILocation(line: 72, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !15, line: 70, column: 5)
!134 = !DILocation(line: 72, column: 9, scope: !133)
!135 = !DILocation(line: 73, column: 9, scope: !133)
!136 = !DILocation(line: 73, column: 20, scope: !133)
!137 = !DILocation(line: 75, column: 12, scope: !123)
!138 = !DILocation(line: 75, column: 5, scope: !123)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 106, type: !25, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocalVariable(name: "data", scope: !139, file: !15, line: 108, type: !6)
!141 = !DILocation(line: 108, column: 15, scope: !139)
!142 = !DILocation(line: 109, column: 23, scope: !139)
!143 = !DILocation(line: 109, column: 12, scope: !139)
!144 = !DILocation(line: 109, column: 10, scope: !139)
!145 = !DILocation(line: 110, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !139, file: !15, line: 110, column: 9)
!147 = !DILocation(line: 110, column: 14, scope: !146)
!148 = !DILocation(line: 110, column: 9, scope: !139)
!149 = !DILocation(line: 110, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !15, line: 110, column: 23)
!151 = !DILocation(line: 111, column: 20, scope: !139)
!152 = !DILocation(line: 112, column: 27, scope: !139)
!153 = !DILocation(line: 112, column: 12, scope: !139)
!154 = !DILocation(line: 112, column: 10, scope: !139)
!155 = !DILocalVariable(name: "dest", scope: !156, file: !15, line: 114, type: !44)
!156 = distinct !DILexicalBlock(scope: !139, file: !15, line: 113, column: 5)
!157 = !DILocation(line: 114, column: 17, scope: !156)
!158 = !DILocation(line: 116, column: 16, scope: !156)
!159 = !DILocation(line: 116, column: 22, scope: !156)
!160 = !DILocation(line: 116, column: 9, scope: !156)
!161 = !DILocation(line: 117, column: 20, scope: !156)
!162 = !DILocation(line: 117, column: 9, scope: !156)
!163 = !DILocation(line: 118, column: 14, scope: !156)
!164 = !DILocation(line: 118, column: 9, scope: !156)
!165 = !DILocation(line: 120, column: 1, scope: !139)
!166 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 95, type: !57, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!167 = !DILocalVariable(name: "data", arg: 1, scope: !166, file: !15, line: 95, type: !6)
!168 = !DILocation(line: 95, column: 43, scope: !166)
!169 = !DILocation(line: 97, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !15, line: 97, column: 8)
!171 = !DILocation(line: 97, column: 8, scope: !166)
!172 = !DILocation(line: 100, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !15, line: 98, column: 5)
!174 = !DILocation(line: 100, column: 9, scope: !173)
!175 = !DILocation(line: 101, column: 9, scope: !173)
!176 = !DILocation(line: 101, column: 20, scope: !173)
!177 = !DILocation(line: 102, column: 5, scope: !173)
!178 = !DILocation(line: 103, column: 12, scope: !166)
!179 = !DILocation(line: 103, column: 5, scope: !166)
