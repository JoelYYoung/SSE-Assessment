; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_15_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !25
  %0 = bitcast i8* %call to i64*, !dbg !26
  store i64* %0, i64** %data, align 8, !dbg !27
  %1 = load i64*, i64** %data, align 8, !dbg !28
  %cmp = icmp eq i64* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !49
  %cmp1 = icmp ult i64 %3, 100, !dbg !51
  br i1 %cmp1, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !55
  %5 = load i64, i64* %arrayidx, align 8, !dbg !55
  %6 = load i64*, i64** %data, align 8, !dbg !56
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !56
  store i64 %5, i64* %arrayidx2, align 8, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %8, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !65
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !65
  call void @printLongLongLine(i64 %10), !dbg !66
  %11 = load i64*, i64** %data, align 8, !dbg !67
  %12 = bitcast i64* %11 to i8*, !dbg !67
  call void @free(i8* %12) #6, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLongLongLine(i64) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_15_good() #0 !dbg !70 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #6, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #6, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_15_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_15_bad(), !dbg !92
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
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i64* null, i64** %data, align 8, !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !99
  %0 = bitcast i8* %call to i64*, !dbg !100
  store i64* %0, i64** %data, align 8, !dbg !101
  %1 = load i64*, i64** %data, align 8, !dbg !102
  %cmp = icmp eq i64* %1, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !117
  %cmp1 = icmp ult i64 %3, 100, !dbg !119
  br i1 %cmp1, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !123
  %5 = load i64, i64* %arrayidx, align 8, !dbg !123
  %6 = load i64*, i64** %data, align 8, !dbg !124
  %7 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !124
  store i64 %5, i64* %arrayidx2, align 8, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !128
  %inc = add i64 %8, 1, !dbg !128
  store i64 %inc, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !132
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !132
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !132
  call void @printLongLongLine(i64 %10), !dbg !133
  %11 = load i64*, i64** %data, align 8, !dbg !134
  %12 = bitcast i64* %11 to i8*, !dbg !134
  call void @free(i8* %12) #6, !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !137 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !138, metadata !DIExpression()), !dbg !139
  store i64* null, i64** %data, align 8, !dbg !140
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !141
  %0 = bitcast i8* %call to i64*, !dbg !142
  store i64* %0, i64** %data, align 8, !dbg !143
  %1 = load i64*, i64** %data, align 8, !dbg !144
  %cmp = icmp eq i64* %1, null, !dbg !146
  br i1 %cmp, label %if.then, label %if.end, !dbg !147

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !148
  unreachable, !dbg !148

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !150, metadata !DIExpression()), !dbg !152
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !152
  call void @llvm.dbg.declare(metadata i64* %i, metadata !153, metadata !DIExpression()), !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !159
  %cmp1 = icmp ult i64 %3, 100, !dbg !161
  br i1 %cmp1, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !165
  %5 = load i64, i64* %arrayidx, align 8, !dbg !165
  %6 = load i64*, i64** %data, align 8, !dbg !166
  %7 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !166
  store i64 %5, i64* %arrayidx2, align 8, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %8, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !174
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !174
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !174
  call void @printLongLongLine(i64 %10), !dbg !175
  %11 = load i64*, i64** %data, align 8, !dbg !176
  %12 = bitcast i64* %11 to i8*, !dbg !176
  call void @free(i8* %12) #6, !dbg !177
  ret void, !dbg !178
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_15_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 24, column: 10, scope: !18)
!25 = !DILocation(line: 29, column: 27, scope: !18)
!26 = !DILocation(line: 29, column: 16, scope: !18)
!27 = !DILocation(line: 29, column: 14, scope: !18)
!28 = !DILocation(line: 30, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 30, column: 13)
!30 = !DILocation(line: 30, column: 18, scope: !29)
!31 = !DILocation(line: 30, column: 13, scope: !18)
!32 = !DILocation(line: 30, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 30, column: 27)
!34 = !DILocalVariable(name: "source", scope: !35, file: !19, line: 38, type: !36)
!35 = distinct !DILexicalBlock(scope: !18, file: !19, line: 37, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 38, column: 17, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !41, file: !19, line: 40, type: !42)
!41 = distinct !DILexicalBlock(scope: !35, file: !19, line: 39, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 40, column: 20, scope: !41)
!46 = !DILocation(line: 42, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !19, line: 42, column: 13)
!48 = !DILocation(line: 42, column: 18, scope: !47)
!49 = !DILocation(line: 42, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !19, line: 42, column: 13)
!51 = !DILocation(line: 42, column: 27, scope: !50)
!52 = !DILocation(line: 42, column: 13, scope: !47)
!53 = !DILocation(line: 44, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !19, line: 43, column: 13)
!55 = !DILocation(line: 44, column: 27, scope: !54)
!56 = !DILocation(line: 44, column: 17, scope: !54)
!57 = !DILocation(line: 44, column: 22, scope: !54)
!58 = !DILocation(line: 44, column: 25, scope: !54)
!59 = !DILocation(line: 45, column: 13, scope: !54)
!60 = !DILocation(line: 42, column: 35, scope: !50)
!61 = !DILocation(line: 42, column: 13, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 45, column: 13, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 46, column: 31, scope: !41)
!66 = !DILocation(line: 46, column: 13, scope: !41)
!67 = !DILocation(line: 47, column: 18, scope: !41)
!68 = !DILocation(line: 47, column: 13, scope: !41)
!69 = !DILocation(line: 50, column: 1, scope: !18)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_15_good", scope: !19, file: !19, line: 120, type: !20, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 122, column: 5, scope: !70)
!72 = !DILocation(line: 123, column: 5, scope: !70)
!73 = !DILocation(line: 124, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 136, type: !75, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !19, line: 136, type: !77)
!82 = !DILocation(line: 136, column: 14, scope: !74)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !19, line: 136, type: !78)
!84 = !DILocation(line: 136, column: 27, scope: !74)
!85 = !DILocation(line: 139, column: 22, scope: !74)
!86 = !DILocation(line: 139, column: 12, scope: !74)
!87 = !DILocation(line: 139, column: 5, scope: !74)
!88 = !DILocation(line: 141, column: 5, scope: !74)
!89 = !DILocation(line: 142, column: 5, scope: !74)
!90 = !DILocation(line: 143, column: 5, scope: !74)
!91 = !DILocation(line: 146, column: 5, scope: !74)
!92 = !DILocation(line: 147, column: 5, scope: !74)
!93 = !DILocation(line: 148, column: 5, scope: !74)
!94 = !DILocation(line: 150, column: 5, scope: !74)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !19, line: 59, type: !4)
!97 = !DILocation(line: 59, column: 15, scope: !95)
!98 = !DILocation(line: 60, column: 10, scope: !95)
!99 = !DILocation(line: 69, column: 27, scope: !95)
!100 = !DILocation(line: 69, column: 16, scope: !95)
!101 = !DILocation(line: 69, column: 14, scope: !95)
!102 = !DILocation(line: 70, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !95, file: !19, line: 70, column: 13)
!104 = !DILocation(line: 70, column: 18, scope: !103)
!105 = !DILocation(line: 70, column: 13, scope: !95)
!106 = !DILocation(line: 70, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !19, line: 70, column: 27)
!108 = !DILocalVariable(name: "source", scope: !109, file: !19, line: 74, type: !36)
!109 = distinct !DILexicalBlock(scope: !95, file: !19, line: 73, column: 5)
!110 = !DILocation(line: 74, column: 17, scope: !109)
!111 = !DILocalVariable(name: "i", scope: !112, file: !19, line: 76, type: !42)
!112 = distinct !DILexicalBlock(scope: !109, file: !19, line: 75, column: 9)
!113 = !DILocation(line: 76, column: 20, scope: !112)
!114 = !DILocation(line: 78, column: 20, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !19, line: 78, column: 13)
!116 = !DILocation(line: 78, column: 18, scope: !115)
!117 = !DILocation(line: 78, column: 25, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !19, line: 78, column: 13)
!119 = !DILocation(line: 78, column: 27, scope: !118)
!120 = !DILocation(line: 78, column: 13, scope: !115)
!121 = !DILocation(line: 80, column: 34, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !19, line: 79, column: 13)
!123 = !DILocation(line: 80, column: 27, scope: !122)
!124 = !DILocation(line: 80, column: 17, scope: !122)
!125 = !DILocation(line: 80, column: 22, scope: !122)
!126 = !DILocation(line: 80, column: 25, scope: !122)
!127 = !DILocation(line: 81, column: 13, scope: !122)
!128 = !DILocation(line: 78, column: 35, scope: !118)
!129 = !DILocation(line: 78, column: 13, scope: !118)
!130 = distinct !{!130, !120, !131, !64}
!131 = !DILocation(line: 81, column: 13, scope: !115)
!132 = !DILocation(line: 82, column: 31, scope: !112)
!133 = !DILocation(line: 82, column: 13, scope: !112)
!134 = !DILocation(line: 83, column: 18, scope: !112)
!135 = !DILocation(line: 83, column: 13, scope: !112)
!136 = !DILocation(line: 86, column: 1, scope: !95)
!137 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 89, type: !20, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocalVariable(name: "data", scope: !137, file: !19, line: 91, type: !4)
!139 = !DILocation(line: 91, column: 15, scope: !137)
!140 = !DILocation(line: 92, column: 10, scope: !137)
!141 = !DILocation(line: 97, column: 27, scope: !137)
!142 = !DILocation(line: 97, column: 16, scope: !137)
!143 = !DILocation(line: 97, column: 14, scope: !137)
!144 = !DILocation(line: 98, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !137, file: !19, line: 98, column: 13)
!146 = !DILocation(line: 98, column: 18, scope: !145)
!147 = !DILocation(line: 98, column: 13, scope: !137)
!148 = !DILocation(line: 98, column: 28, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !19, line: 98, column: 27)
!150 = !DILocalVariable(name: "source", scope: !151, file: !19, line: 106, type: !36)
!151 = distinct !DILexicalBlock(scope: !137, file: !19, line: 105, column: 5)
!152 = !DILocation(line: 106, column: 17, scope: !151)
!153 = !DILocalVariable(name: "i", scope: !154, file: !19, line: 108, type: !42)
!154 = distinct !DILexicalBlock(scope: !151, file: !19, line: 107, column: 9)
!155 = !DILocation(line: 108, column: 20, scope: !154)
!156 = !DILocation(line: 110, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !19, line: 110, column: 13)
!158 = !DILocation(line: 110, column: 18, scope: !157)
!159 = !DILocation(line: 110, column: 25, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !19, line: 110, column: 13)
!161 = !DILocation(line: 110, column: 27, scope: !160)
!162 = !DILocation(line: 110, column: 13, scope: !157)
!163 = !DILocation(line: 112, column: 34, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !19, line: 111, column: 13)
!165 = !DILocation(line: 112, column: 27, scope: !164)
!166 = !DILocation(line: 112, column: 17, scope: !164)
!167 = !DILocation(line: 112, column: 22, scope: !164)
!168 = !DILocation(line: 112, column: 25, scope: !164)
!169 = !DILocation(line: 113, column: 13, scope: !164)
!170 = !DILocation(line: 110, column: 35, scope: !160)
!171 = !DILocation(line: 110, column: 13, scope: !160)
!172 = distinct !{!172, !162, !173, !64}
!173 = !DILocation(line: 113, column: 13, scope: !157)
!174 = !DILocation(line: 114, column: 31, scope: !154)
!175 = !DILocation(line: 114, column: 13, scope: !154)
!176 = !DILocation(line: 115, column: 18, scope: !154)
!177 = !DILocation(line: 115, column: 13, scope: !154)
!178 = !DILocation(line: 118, column: 1, scope: !137)
