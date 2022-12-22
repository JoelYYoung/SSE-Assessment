; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !15
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !19

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_21_bad() #0 !dbg !27 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store i64* null, i64** %data, align 8, !dbg !32
  store i32 1, i32* @badStatic, align 4, !dbg !33
  %0 = load i64*, i64** %data, align 8, !dbg !34
  %call = call i64* @badSource(i64* %0), !dbg !35
  store i64* %call, i64** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !42
  %2 = load i64*, i64** %data, align 8, !dbg !43
  %3 = bitcast i64* %2 to i8*, !dbg !44
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !44
  %4 = bitcast i64* %arraydecay to i8*, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !44
  %5 = load i64*, i64** %data, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !45
  %6 = load i64, i64* %arrayidx, align 8, !dbg !45
  call void @printLongLongLine(i64 %6), !dbg !46
  %7 = load i64*, i64** %data, align 8, !dbg !47
  %8 = bitcast i64* %7 to i8*, !dbg !47
  call void @free(i8* %8) #7, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i64* @badSource(i64* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load i32, i32* @badStatic, align 4, !dbg !55
  %tobool = icmp ne i32 %0, 0, !dbg !55
  br i1 %tobool, label %if.then, label %if.end2, !dbg !57

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !58
  %1 = bitcast i8* %call to i64*, !dbg !60
  store i64* %1, i64** %data.addr, align 8, !dbg !61
  %2 = load i64*, i64** %data.addr, align 8, !dbg !62
  %cmp = icmp eq i64* %2, null, !dbg !64
  br i1 %cmp, label %if.then1, label %if.end, !dbg !65

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !66
  unreachable, !dbg !66

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !68

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i64*, i64** %data.addr, align 8, !dbg !69
  ret i64* %3, !dbg !70
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_21_good() #0 !dbg !71 {
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
  %call = call i64 @time(i64* null) #7, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #7, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_21_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_21_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
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
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i64* null, i64** %data, align 8, !dbg !98
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !99
  %0 = load i64*, i64** %data, align 8, !dbg !100
  %call = call i64* @goodG2B1Source(i64* %0), !dbg !101
  store i64* %call, i64** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !105
  %2 = load i64*, i64** %data, align 8, !dbg !106
  %3 = bitcast i64* %2 to i8*, !dbg !107
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !107
  %4 = bitcast i64* %arraydecay to i8*, !dbg !107
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !107
  %5 = load i64*, i64** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !108
  %6 = load i64, i64* %arrayidx, align 8, !dbg !108
  call void @printLongLongLine(i64 %6), !dbg !109
  %7 = load i64*, i64** %data, align 8, !dbg !110
  %8 = bitcast i64* %7 to i8*, !dbg !110
  call void @free(i8* %8) #7, !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal i64* @goodG2B1Source(i64* %data) #0 !dbg !113 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !116
  %tobool = icmp ne i32 %0, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  br label %if.end2, !dbg !121

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !122
  %1 = bitcast i8* %call to i64*, !dbg !124
  store i64* %1, i64** %data.addr, align 8, !dbg !125
  %2 = load i64*, i64** %data.addr, align 8, !dbg !126
  %cmp = icmp eq i64* %2, null, !dbg !128
  br i1 %cmp, label %if.then1, label %if.end, !dbg !129

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i64*, i64** %data.addr, align 8, !dbg !132
  ret i64* %3, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i64* null, i64** %data, align 8, !dbg !137
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !138
  %0 = load i64*, i64** %data, align 8, !dbg !139
  %call = call i64* @goodG2B2Source(i64* %0), !dbg !140
  store i64* %call, i64** %data, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !142, metadata !DIExpression()), !dbg !144
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !144
  %2 = load i64*, i64** %data, align 8, !dbg !145
  %3 = bitcast i64* %2 to i8*, !dbg !146
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !146
  %4 = bitcast i64* %arraydecay to i8*, !dbg !146
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !146
  %5 = load i64*, i64** %data, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !147
  %6 = load i64, i64* %arrayidx, align 8, !dbg !147
  call void @printLongLongLine(i64 %6), !dbg !148
  %7 = load i64*, i64** %data, align 8, !dbg !149
  %8 = bitcast i64* %7 to i8*, !dbg !149
  call void @free(i8* %8) #7, !dbg !150
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal i64* @goodG2B2Source(i64* %data) #0 !dbg !152 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !153, metadata !DIExpression()), !dbg !154
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !155
  %tobool = icmp ne i32 %0, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.end2, !dbg !157

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !158
  %1 = bitcast i8* %call to i64*, !dbg !160
  store i64* %1, i64** %data.addr, align 8, !dbg !161
  %2 = load i64*, i64** %data.addr, align 8, !dbg !162
  %cmp = icmp eq i64* %2, null, !dbg !164
  br i1 %cmp, label %if.then1, label %if.end, !dbg !165

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !166
  unreachable, !dbg !166

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !168

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i64*, i64** %data.addr, align 8, !dbg !169
  ret i64* %3, !dbg !170
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
!llvm.module.flags = !{!21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !17, line: 22, type: !18, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !13}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 43, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !{!0, !15, !19}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !17, line: 55, type: !18, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_21.c", directory: "/root/SSE-Assessment")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !17, line: 56, type: !18, isLocal: true, isDefinition: true)
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 7, !"uwtable", i32 1}
!25 = !{i32 7, !"frame-pointer", i32 2}
!26 = !{!"clang version 13.0.0"}
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_21_bad", scope: !17, file: !17, line: 35, type: !28, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocalVariable(name: "data", scope: !27, file: !17, line: 37, type: !7)
!31 = !DILocation(line: 37, column: 15, scope: !27)
!32 = !DILocation(line: 38, column: 10, scope: !27)
!33 = !DILocation(line: 39, column: 15, scope: !27)
!34 = !DILocation(line: 40, column: 22, scope: !27)
!35 = !DILocation(line: 40, column: 12, scope: !27)
!36 = !DILocation(line: 40, column: 10, scope: !27)
!37 = !DILocalVariable(name: "source", scope: !38, file: !17, line: 42, type: !39)
!38 = distinct !DILexicalBlock(scope: !27, file: !17, line: 41, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 42, column: 17, scope: !38)
!43 = !DILocation(line: 44, column: 17, scope: !38)
!44 = !DILocation(line: 44, column: 9, scope: !38)
!45 = !DILocation(line: 45, column: 27, scope: !38)
!46 = !DILocation(line: 45, column: 9, scope: !38)
!47 = !DILocation(line: 46, column: 14, scope: !38)
!48 = !DILocation(line: 46, column: 9, scope: !38)
!49 = !DILocation(line: 48, column: 1, scope: !27)
!50 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 24, type: !51, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!7, !7}
!53 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !17, line: 24, type: !7)
!54 = !DILocation(line: 24, column: 38, scope: !50)
!55 = !DILocation(line: 26, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !17, line: 26, column: 8)
!57 = !DILocation(line: 26, column: 8, scope: !50)
!58 = !DILocation(line: 29, column: 27, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !17, line: 27, column: 5)
!60 = !DILocation(line: 29, column: 16, scope: !59)
!61 = !DILocation(line: 29, column: 14, scope: !59)
!62 = !DILocation(line: 30, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !17, line: 30, column: 13)
!64 = !DILocation(line: 30, column: 18, scope: !63)
!65 = !DILocation(line: 30, column: 13, scope: !59)
!66 = !DILocation(line: 30, column: 28, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !17, line: 30, column: 27)
!68 = !DILocation(line: 31, column: 5, scope: !59)
!69 = !DILocation(line: 32, column: 12, scope: !50)
!70 = !DILocation(line: 32, column: 5, scope: !50)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_21_good", scope: !17, file: !17, line: 117, type: !28, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocation(line: 119, column: 5, scope: !71)
!73 = !DILocation(line: 120, column: 5, scope: !71)
!74 = !DILocation(line: 121, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 133, type: !76, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{!18, !18, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !17, line: 133, type: !18)
!82 = !DILocation(line: 133, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !17, line: 133, type: !78)
!84 = !DILocation(line: 133, column: 27, scope: !75)
!85 = !DILocation(line: 136, column: 22, scope: !75)
!86 = !DILocation(line: 136, column: 12, scope: !75)
!87 = !DILocation(line: 136, column: 5, scope: !75)
!88 = !DILocation(line: 138, column: 5, scope: !75)
!89 = !DILocation(line: 139, column: 5, scope: !75)
!90 = !DILocation(line: 140, column: 5, scope: !75)
!91 = !DILocation(line: 143, column: 5, scope: !75)
!92 = !DILocation(line: 144, column: 5, scope: !75)
!93 = !DILocation(line: 145, column: 5, scope: !75)
!94 = !DILocation(line: 147, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 75, type: !28, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !17, line: 77, type: !7)
!97 = !DILocation(line: 77, column: 15, scope: !95)
!98 = !DILocation(line: 78, column: 10, scope: !95)
!99 = !DILocation(line: 79, column: 20, scope: !95)
!100 = !DILocation(line: 80, column: 27, scope: !95)
!101 = !DILocation(line: 80, column: 12, scope: !95)
!102 = !DILocation(line: 80, column: 10, scope: !95)
!103 = !DILocalVariable(name: "source", scope: !104, file: !17, line: 82, type: !39)
!104 = distinct !DILexicalBlock(scope: !95, file: !17, line: 81, column: 5)
!105 = !DILocation(line: 82, column: 17, scope: !104)
!106 = !DILocation(line: 84, column: 17, scope: !104)
!107 = !DILocation(line: 84, column: 9, scope: !104)
!108 = !DILocation(line: 85, column: 27, scope: !104)
!109 = !DILocation(line: 85, column: 9, scope: !104)
!110 = !DILocation(line: 86, column: 14, scope: !104)
!111 = !DILocation(line: 86, column: 9, scope: !104)
!112 = !DILocation(line: 88, column: 1, scope: !95)
!113 = distinct !DISubprogram(name: "goodG2B1Source", scope: !17, file: !17, line: 59, type: !51, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocalVariable(name: "data", arg: 1, scope: !113, file: !17, line: 59, type: !7)
!115 = !DILocation(line: 59, column: 43, scope: !113)
!116 = !DILocation(line: 61, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !17, line: 61, column: 8)
!118 = !DILocation(line: 61, column: 8, scope: !113)
!119 = !DILocation(line: 64, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !17, line: 62, column: 5)
!121 = !DILocation(line: 65, column: 5, scope: !120)
!122 = !DILocation(line: 69, column: 27, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !17, line: 67, column: 5)
!124 = !DILocation(line: 69, column: 16, scope: !123)
!125 = !DILocation(line: 69, column: 14, scope: !123)
!126 = !DILocation(line: 70, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !17, line: 70, column: 13)
!128 = !DILocation(line: 70, column: 18, scope: !127)
!129 = !DILocation(line: 70, column: 13, scope: !123)
!130 = !DILocation(line: 70, column: 28, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !17, line: 70, column: 27)
!132 = !DILocation(line: 72, column: 12, scope: !113)
!133 = !DILocation(line: 72, column: 5, scope: !113)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 102, type: !28, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!135 = !DILocalVariable(name: "data", scope: !134, file: !17, line: 104, type: !7)
!136 = !DILocation(line: 104, column: 15, scope: !134)
!137 = !DILocation(line: 105, column: 10, scope: !134)
!138 = !DILocation(line: 106, column: 20, scope: !134)
!139 = !DILocation(line: 107, column: 27, scope: !134)
!140 = !DILocation(line: 107, column: 12, scope: !134)
!141 = !DILocation(line: 107, column: 10, scope: !134)
!142 = !DILocalVariable(name: "source", scope: !143, file: !17, line: 109, type: !39)
!143 = distinct !DILexicalBlock(scope: !134, file: !17, line: 108, column: 5)
!144 = !DILocation(line: 109, column: 17, scope: !143)
!145 = !DILocation(line: 111, column: 17, scope: !143)
!146 = !DILocation(line: 111, column: 9, scope: !143)
!147 = !DILocation(line: 112, column: 27, scope: !143)
!148 = !DILocation(line: 112, column: 9, scope: !143)
!149 = !DILocation(line: 113, column: 14, scope: !143)
!150 = !DILocation(line: 113, column: 9, scope: !143)
!151 = !DILocation(line: 115, column: 1, scope: !134)
!152 = distinct !DISubprogram(name: "goodG2B2Source", scope: !17, file: !17, line: 91, type: !51, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!153 = !DILocalVariable(name: "data", arg: 1, scope: !152, file: !17, line: 91, type: !7)
!154 = !DILocation(line: 91, column: 43, scope: !152)
!155 = !DILocation(line: 93, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !17, line: 93, column: 8)
!157 = !DILocation(line: 93, column: 8, scope: !152)
!158 = !DILocation(line: 96, column: 27, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !17, line: 94, column: 5)
!160 = !DILocation(line: 96, column: 16, scope: !159)
!161 = !DILocation(line: 96, column: 14, scope: !159)
!162 = !DILocation(line: 97, column: 13, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !17, line: 97, column: 13)
!164 = !DILocation(line: 97, column: 18, scope: !163)
!165 = !DILocation(line: 97, column: 13, scope: !159)
!166 = !DILocation(line: 97, column: 28, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !17, line: 97, column: 27)
!168 = !DILocation(line: 98, column: 5, scope: !159)
!169 = !DILocation(line: 99, column: 12, scope: !152)
!170 = !DILocation(line: 99, column: 5, scope: !152)
