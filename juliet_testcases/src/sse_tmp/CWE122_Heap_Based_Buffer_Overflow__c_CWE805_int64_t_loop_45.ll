; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_badData = internal global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_goodG2BData = internal global i64* null, align 8, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_bad() #0 !dbg !24 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !30
  %0 = bitcast i8* %call to i64*, !dbg !31
  store i64* %0, i64** %data, align 8, !dbg !32
  %1 = load i64*, i64** %data, align 8, !dbg !33
  %cmp = icmp eq i64* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !39
  store i64* %2, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_badData, align 8, !dbg !40
  call void @badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #6, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #6, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_badData, align 8, !dbg !70
  store i64* %0, i64** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !71, metadata !DIExpression()), !dbg !76
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !86
  %cmp = icmp ult i64 %2, 100, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !92
  %4 = load i64, i64* %arrayidx, align 8, !dbg !92
  %5 = load i64*, i64** %data, align 8, !dbg !93
  %6 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !93
  store i64 %4, i64* %arrayidx1, align 8, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %7, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !102
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !102
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !102
  call void @printLongLongLine(i64 %9), !dbg !103
  %10 = load i64*, i64** %data, align 8, !dbg !104
  %11 = bitcast i64* %10 to i8*, !dbg !104
  call void @free(i8* %11) #6, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i64* null, i64** %data, align 8, !dbg !110
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !111
  %0 = bitcast i8* %call to i64*, !dbg !112
  store i64* %0, i64** %data, align 8, !dbg !113
  %1 = load i64*, i64** %data, align 8, !dbg !114
  %cmp = icmp eq i64* %1, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !120
  store i64* %2, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_goodG2BData, align 8, !dbg !121
  call void @goodG2BSink(), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !124 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_goodG2BData, align 8, !dbg !127
  store i64* %0, i64** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !137
  %cmp = icmp ult i64 %2, 100, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !143
  %4 = load i64, i64* %arrayidx, align 8, !dbg !143
  %5 = load i64*, i64** %data, align 8, !dbg !144
  %6 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !144
  store i64 %4, i64* %arrayidx1, align 8, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %7, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !152
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !152
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !152
  call void @printLongLongLine(i64 %9), !dbg !153
  %10 = load i64*, i64** %data, align 8, !dbg !154
  %11 = bitcast i64* %10 to i8*, !dbg !154
  call void @free(i8* %11) #6, !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_badData", scope: !2, file: !17, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12, !13}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 43, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_goodG2BData", scope: !2, file: !17, line: 20, type: !6, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45.c", directory: "/root/SSE-Assessment")
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_bad", scope: !17, file: !17, line: 42, type: !25, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !17, line: 44, type: !6)
!28 = !DILocation(line: 44, column: 15, scope: !24)
!29 = !DILocation(line: 45, column: 10, scope: !24)
!30 = !DILocation(line: 47, column: 23, scope: !24)
!31 = !DILocation(line: 47, column: 12, scope: !24)
!32 = !DILocation(line: 47, column: 10, scope: !24)
!33 = !DILocation(line: 48, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !24, file: !17, line: 48, column: 9)
!35 = !DILocation(line: 48, column: 14, scope: !34)
!36 = !DILocation(line: 48, column: 9, scope: !24)
!37 = !DILocation(line: 48, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 48, column: 23)
!39 = !DILocation(line: 49, column: 75, scope: !24)
!40 = !DILocation(line: 49, column: 73, scope: !24)
!41 = !DILocation(line: 50, column: 5, scope: !24)
!42 = !DILocation(line: 51, column: 1, scope: !24)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_45_good", scope: !17, file: !17, line: 87, type: !25, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocation(line: 89, column: 5, scope: !43)
!45 = !DILocation(line: 90, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 101, type: !47, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !17, line: 101, type: !49)
!54 = !DILocation(line: 101, column: 14, scope: !46)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !17, line: 101, type: !50)
!56 = !DILocation(line: 101, column: 27, scope: !46)
!57 = !DILocation(line: 104, column: 22, scope: !46)
!58 = !DILocation(line: 104, column: 12, scope: !46)
!59 = !DILocation(line: 104, column: 5, scope: !46)
!60 = !DILocation(line: 106, column: 5, scope: !46)
!61 = !DILocation(line: 107, column: 5, scope: !46)
!62 = !DILocation(line: 108, column: 5, scope: !46)
!63 = !DILocation(line: 111, column: 5, scope: !46)
!64 = !DILocation(line: 112, column: 5, scope: !46)
!65 = !DILocation(line: 113, column: 5, scope: !46)
!66 = !DILocation(line: 115, column: 5, scope: !46)
!67 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 24, type: !25, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !17, line: 26, type: !6)
!69 = !DILocation(line: 26, column: 15, scope: !67)
!70 = !DILocation(line: 26, column: 22, scope: !67)
!71 = !DILocalVariable(name: "source", scope: !72, file: !17, line: 28, type: !73)
!72 = distinct !DILexicalBlock(scope: !67, file: !17, line: 27, column: 5)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 100)
!76 = !DILocation(line: 28, column: 17, scope: !72)
!77 = !DILocalVariable(name: "i", scope: !78, file: !17, line: 30, type: !79)
!78 = distinct !DILexicalBlock(scope: !72, file: !17, line: 29, column: 9)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !80, line: 46, baseType: !81)
!80 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!81 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!82 = !DILocation(line: 30, column: 20, scope: !78)
!83 = !DILocation(line: 32, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !17, line: 32, column: 13)
!85 = !DILocation(line: 32, column: 18, scope: !84)
!86 = !DILocation(line: 32, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !17, line: 32, column: 13)
!88 = !DILocation(line: 32, column: 27, scope: !87)
!89 = !DILocation(line: 32, column: 13, scope: !84)
!90 = !DILocation(line: 34, column: 34, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !17, line: 33, column: 13)
!92 = !DILocation(line: 34, column: 27, scope: !91)
!93 = !DILocation(line: 34, column: 17, scope: !91)
!94 = !DILocation(line: 34, column: 22, scope: !91)
!95 = !DILocation(line: 34, column: 25, scope: !91)
!96 = !DILocation(line: 35, column: 13, scope: !91)
!97 = !DILocation(line: 32, column: 35, scope: !87)
!98 = !DILocation(line: 32, column: 13, scope: !87)
!99 = distinct !{!99, !89, !100, !101}
!100 = !DILocation(line: 35, column: 13, scope: !84)
!101 = !{!"llvm.loop.mustprogress"}
!102 = !DILocation(line: 36, column: 31, scope: !78)
!103 = !DILocation(line: 36, column: 13, scope: !78)
!104 = !DILocation(line: 37, column: 18, scope: !78)
!105 = !DILocation(line: 37, column: 13, scope: !78)
!106 = !DILocation(line: 40, column: 1, scope: !67)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 76, type: !25, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !17, line: 78, type: !6)
!109 = !DILocation(line: 78, column: 15, scope: !107)
!110 = !DILocation(line: 79, column: 10, scope: !107)
!111 = !DILocation(line: 81, column: 23, scope: !107)
!112 = !DILocation(line: 81, column: 12, scope: !107)
!113 = !DILocation(line: 81, column: 10, scope: !107)
!114 = !DILocation(line: 82, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !17, line: 82, column: 9)
!116 = !DILocation(line: 82, column: 14, scope: !115)
!117 = !DILocation(line: 82, column: 9, scope: !107)
!118 = !DILocation(line: 82, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !17, line: 82, column: 23)
!120 = !DILocation(line: 83, column: 79, scope: !107)
!121 = !DILocation(line: 83, column: 77, scope: !107)
!122 = !DILocation(line: 84, column: 5, scope: !107)
!123 = !DILocation(line: 85, column: 1, scope: !107)
!124 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 58, type: !25, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !17, line: 60, type: !6)
!126 = !DILocation(line: 60, column: 15, scope: !124)
!127 = !DILocation(line: 60, column: 22, scope: !124)
!128 = !DILocalVariable(name: "source", scope: !129, file: !17, line: 62, type: !73)
!129 = distinct !DILexicalBlock(scope: !124, file: !17, line: 61, column: 5)
!130 = !DILocation(line: 62, column: 17, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !132, file: !17, line: 64, type: !79)
!132 = distinct !DILexicalBlock(scope: !129, file: !17, line: 63, column: 9)
!133 = !DILocation(line: 64, column: 20, scope: !132)
!134 = !DILocation(line: 66, column: 20, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !17, line: 66, column: 13)
!136 = !DILocation(line: 66, column: 18, scope: !135)
!137 = !DILocation(line: 66, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !17, line: 66, column: 13)
!139 = !DILocation(line: 66, column: 27, scope: !138)
!140 = !DILocation(line: 66, column: 13, scope: !135)
!141 = !DILocation(line: 68, column: 34, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !17, line: 67, column: 13)
!143 = !DILocation(line: 68, column: 27, scope: !142)
!144 = !DILocation(line: 68, column: 17, scope: !142)
!145 = !DILocation(line: 68, column: 22, scope: !142)
!146 = !DILocation(line: 68, column: 25, scope: !142)
!147 = !DILocation(line: 69, column: 13, scope: !142)
!148 = !DILocation(line: 66, column: 35, scope: !138)
!149 = !DILocation(line: 66, column: 13, scope: !138)
!150 = distinct !{!150, !140, !151, !101}
!151 = !DILocation(line: 69, column: 13, scope: !135)
!152 = !DILocation(line: 70, column: 31, scope: !132)
!153 = !DILocation(line: 70, column: 13, scope: !132)
!154 = !DILocation(line: 71, column: 18, scope: !132)
!155 = !DILocation(line: 71, column: 13, scope: !132)
!156 = !DILocation(line: 74, column: 1, scope: !124)
