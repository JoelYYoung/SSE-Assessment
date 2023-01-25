; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  store i32 1, i32* @badStatic, align 4, !dbg !28
  %0 = load i32*, i32** %data, align 8, !dbg !29
  %call = call i32* @badSource(i32* %0), !dbg !30
  store i32* %call, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %3 = bitcast i32* %2 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !39
  %4 = bitcast i32* %arraydecay to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !39
  %5 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !40
  %6 = load i32, i32* %arrayidx, align 4, !dbg !40
  call void @printIntLine(i32 %6), !dbg !41
  %7 = load i32*, i32** %data, align 8, !dbg !42
  %8 = bitcast i32* %7 to i8*, !dbg !42
  call void @free(i8* %8) #7, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !45 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i32, i32* @badStatic, align 4, !dbg !50
  %tobool = icmp ne i32 %0, 0, !dbg !50
  br i1 %tobool, label %if.then, label %if.end2, !dbg !52

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !53
  %1 = bitcast i8* %call to i32*, !dbg !55
  store i32* %1, i32** %data.addr, align 8, !dbg !56
  %2 = load i32*, i32** %data.addr, align 8, !dbg !57
  %cmp = icmp eq i32* %2, null, !dbg !59
  br i1 %cmp, label %if.then1, label %if.end, !dbg !60

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !61
  unreachable, !dbg !61

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !63

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !64
  ret i32* %3, !dbg !65
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_21_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #7, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #7, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_21_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_21_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !94
  %0 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !96
  store i32* %call, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !100
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %3 = bitcast i32* %2 to i8*, !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !102
  %4 = bitcast i32* %arraydecay to i8*, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !102
  %5 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !103
  %6 = load i32, i32* %arrayidx, align 4, !dbg !103
  call void @printIntLine(i32 %6), !dbg !104
  %7 = load i32*, i32** %data, align 8, !dbg !105
  %8 = bitcast i32* %7 to i8*, !dbg !105
  call void @free(i8* %8) #7, !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !108 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end2, !dbg !116

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !117
  %1 = bitcast i8* %call to i32*, !dbg !119
  store i32* %1, i32** %data.addr, align 8, !dbg !120
  %2 = load i32*, i32** %data.addr, align 8, !dbg !121
  %cmp = icmp eq i32* %2, null, !dbg !123
  br i1 %cmp, label %if.then1, label %if.end, !dbg !124

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !127
  ret i32* %3, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !129 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !130, metadata !DIExpression()), !dbg !131
  store i32* null, i32** %data, align 8, !dbg !132
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !133
  %0 = load i32*, i32** %data, align 8, !dbg !134
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !135
  store i32* %call, i32** %data, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !139
  %2 = load i32*, i32** %data, align 8, !dbg !140
  %3 = bitcast i32* %2 to i8*, !dbg !141
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !141
  %4 = bitcast i32* %arraydecay to i8*, !dbg !141
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !141
  %5 = load i32*, i32** %data, align 8, !dbg !142
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !142
  %6 = load i32, i32* %arrayidx, align 4, !dbg !142
  call void @printIntLine(i32 %6), !dbg !143
  %7 = load i32*, i32** %data, align 8, !dbg !144
  %8 = bitcast i32* %7 to i8*, !dbg !144
  call void @free(i8* %8) #7, !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !147 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !150
  %tobool = icmp ne i32 %0, 0, !dbg !150
  br i1 %tobool, label %if.then, label %if.end2, !dbg !152

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !153
  %1 = bitcast i8* %call to i32*, !dbg !155
  store i32* %1, i32** %data.addr, align 8, !dbg !156
  %2 = load i32*, i32** %data.addr, align 8, !dbg !157
  %cmp = icmp eq i32* %2, null, !dbg !159
  br i1 %cmp, label %if.then1, label %if.end, !dbg !160

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !161
  unreachable, !dbg !161

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !163

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !164
  ret i32* %3, !dbg !165
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 22, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !14}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 55, type: !8, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 56, type: !8, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_21_bad", scope: !13, file: !13, line: 35, type: !23, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !13, line: 37, type: !7)
!26 = !DILocation(line: 37, column: 11, scope: !22)
!27 = !DILocation(line: 38, column: 10, scope: !22)
!28 = !DILocation(line: 39, column: 15, scope: !22)
!29 = !DILocation(line: 40, column: 22, scope: !22)
!30 = !DILocation(line: 40, column: 12, scope: !22)
!31 = !DILocation(line: 40, column: 10, scope: !22)
!32 = !DILocalVariable(name: "source", scope: !33, file: !13, line: 42, type: !34)
!33 = distinct !DILexicalBlock(scope: !22, file: !13, line: 41, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 42, column: 13, scope: !33)
!38 = !DILocation(line: 44, column: 16, scope: !33)
!39 = !DILocation(line: 44, column: 9, scope: !33)
!40 = !DILocation(line: 45, column: 22, scope: !33)
!41 = !DILocation(line: 45, column: 9, scope: !33)
!42 = !DILocation(line: 46, column: 14, scope: !33)
!43 = !DILocation(line: 46, column: 9, scope: !33)
!44 = !DILocation(line: 48, column: 1, scope: !22)
!45 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 24, type: !46, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!7, !7}
!48 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !13, line: 24, type: !7)
!49 = !DILocation(line: 24, column: 30, scope: !45)
!50 = !DILocation(line: 26, column: 8, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !13, line: 26, column: 8)
!52 = !DILocation(line: 26, column: 8, scope: !45)
!53 = !DILocation(line: 29, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !13, line: 27, column: 5)
!55 = !DILocation(line: 29, column: 16, scope: !54)
!56 = !DILocation(line: 29, column: 14, scope: !54)
!57 = !DILocation(line: 30, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !13, line: 30, column: 13)
!59 = !DILocation(line: 30, column: 18, scope: !58)
!60 = !DILocation(line: 30, column: 13, scope: !54)
!61 = !DILocation(line: 30, column: 28, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !13, line: 30, column: 27)
!63 = !DILocation(line: 31, column: 5, scope: !54)
!64 = !DILocation(line: 32, column: 12, scope: !45)
!65 = !DILocation(line: 32, column: 5, scope: !45)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_21_good", scope: !13, file: !13, line: 117, type: !23, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 119, column: 5, scope: !66)
!68 = !DILocation(line: 120, column: 5, scope: !66)
!69 = !DILocation(line: 121, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 133, type: !71, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!8, !8, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !13, line: 133, type: !8)
!77 = !DILocation(line: 133, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !13, line: 133, type: !73)
!79 = !DILocation(line: 133, column: 27, scope: !70)
!80 = !DILocation(line: 136, column: 22, scope: !70)
!81 = !DILocation(line: 136, column: 12, scope: !70)
!82 = !DILocation(line: 136, column: 5, scope: !70)
!83 = !DILocation(line: 138, column: 5, scope: !70)
!84 = !DILocation(line: 139, column: 5, scope: !70)
!85 = !DILocation(line: 140, column: 5, scope: !70)
!86 = !DILocation(line: 143, column: 5, scope: !70)
!87 = !DILocation(line: 144, column: 5, scope: !70)
!88 = !DILocation(line: 145, column: 5, scope: !70)
!89 = !DILocation(line: 147, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 75, type: !23, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !13, line: 77, type: !7)
!92 = !DILocation(line: 77, column: 11, scope: !90)
!93 = !DILocation(line: 78, column: 10, scope: !90)
!94 = !DILocation(line: 79, column: 20, scope: !90)
!95 = !DILocation(line: 80, column: 27, scope: !90)
!96 = !DILocation(line: 80, column: 12, scope: !90)
!97 = !DILocation(line: 80, column: 10, scope: !90)
!98 = !DILocalVariable(name: "source", scope: !99, file: !13, line: 82, type: !34)
!99 = distinct !DILexicalBlock(scope: !90, file: !13, line: 81, column: 5)
!100 = !DILocation(line: 82, column: 13, scope: !99)
!101 = !DILocation(line: 84, column: 16, scope: !99)
!102 = !DILocation(line: 84, column: 9, scope: !99)
!103 = !DILocation(line: 85, column: 22, scope: !99)
!104 = !DILocation(line: 85, column: 9, scope: !99)
!105 = !DILocation(line: 86, column: 14, scope: !99)
!106 = !DILocation(line: 86, column: 9, scope: !99)
!107 = !DILocation(line: 88, column: 1, scope: !90)
!108 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 59, type: !46, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", arg: 1, scope: !108, file: !13, line: 59, type: !7)
!110 = !DILocation(line: 59, column: 35, scope: !108)
!111 = !DILocation(line: 61, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !13, line: 61, column: 8)
!113 = !DILocation(line: 61, column: 8, scope: !108)
!114 = !DILocation(line: 64, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !13, line: 62, column: 5)
!116 = !DILocation(line: 65, column: 5, scope: !115)
!117 = !DILocation(line: 69, column: 23, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !13, line: 67, column: 5)
!119 = !DILocation(line: 69, column: 16, scope: !118)
!120 = !DILocation(line: 69, column: 14, scope: !118)
!121 = !DILocation(line: 70, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !13, line: 70, column: 13)
!123 = !DILocation(line: 70, column: 18, scope: !122)
!124 = !DILocation(line: 70, column: 13, scope: !118)
!125 = !DILocation(line: 70, column: 28, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !13, line: 70, column: 27)
!127 = !DILocation(line: 72, column: 12, scope: !108)
!128 = !DILocation(line: 72, column: 5, scope: !108)
!129 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 102, type: !23, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocalVariable(name: "data", scope: !129, file: !13, line: 104, type: !7)
!131 = !DILocation(line: 104, column: 11, scope: !129)
!132 = !DILocation(line: 105, column: 10, scope: !129)
!133 = !DILocation(line: 106, column: 20, scope: !129)
!134 = !DILocation(line: 107, column: 27, scope: !129)
!135 = !DILocation(line: 107, column: 12, scope: !129)
!136 = !DILocation(line: 107, column: 10, scope: !129)
!137 = !DILocalVariable(name: "source", scope: !138, file: !13, line: 109, type: !34)
!138 = distinct !DILexicalBlock(scope: !129, file: !13, line: 108, column: 5)
!139 = !DILocation(line: 109, column: 13, scope: !138)
!140 = !DILocation(line: 111, column: 16, scope: !138)
!141 = !DILocation(line: 111, column: 9, scope: !138)
!142 = !DILocation(line: 112, column: 22, scope: !138)
!143 = !DILocation(line: 112, column: 9, scope: !138)
!144 = !DILocation(line: 113, column: 14, scope: !138)
!145 = !DILocation(line: 113, column: 9, scope: !138)
!146 = !DILocation(line: 115, column: 1, scope: !129)
!147 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 91, type: !46, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", arg: 1, scope: !147, file: !13, line: 91, type: !7)
!149 = !DILocation(line: 91, column: 35, scope: !147)
!150 = !DILocation(line: 93, column: 8, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !13, line: 93, column: 8)
!152 = !DILocation(line: 93, column: 8, scope: !147)
!153 = !DILocation(line: 96, column: 23, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !13, line: 94, column: 5)
!155 = !DILocation(line: 96, column: 16, scope: !154)
!156 = !DILocation(line: 96, column: 14, scope: !154)
!157 = !DILocation(line: 97, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !13, line: 97, column: 13)
!159 = !DILocation(line: 97, column: 18, scope: !158)
!160 = !DILocation(line: 97, column: 13, scope: !154)
!161 = !DILocation(line: 97, column: 28, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !13, line: 97, column: 27)
!163 = !DILocation(line: 98, column: 5, scope: !154)
!164 = !DILocation(line: 99, column: 12, scope: !147)
!165 = !DILocation(line: 99, column: 5, scope: !147)
