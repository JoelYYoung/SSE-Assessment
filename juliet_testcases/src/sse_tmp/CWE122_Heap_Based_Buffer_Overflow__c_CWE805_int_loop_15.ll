; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !22
  store i32* %0, i32** %data, align 8, !dbg !23
  %1 = load i32*, i32** %data, align 8, !dbg !24
  %cmp = icmp eq i32* %1, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !45
  %cmp1 = icmp ult i64 %3, 100, !dbg !47
  br i1 %cmp1, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !51
  %5 = load i32, i32* %arrayidx, align 4, !dbg !51
  %6 = load i32*, i32** %data, align 8, !dbg !52
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !52
  store i32 %5, i32* %arrayidx2, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %8, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !61
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !61
  call void @printIntLine(i32 %10), !dbg !62
  %11 = load i32*, i32** %data, align 8, !dbg !63
  %12 = bitcast i32* %11 to i8*, !dbg !63
  call void @free(i8* %12) #6, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_15_good() #0 !dbg !66 {
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
  %call = call i64 @time(i64* null) #6, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #6, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_15_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_15_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !94
  %0 = bitcast i8* %call to i32*, !dbg !95
  store i32* %0, i32** %data, align 8, !dbg !96
  %1 = load i32*, i32** %data, align 8, !dbg !97
  %cmp = icmp eq i32* %1, null, !dbg !99
  br i1 %cmp, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !105
  call void @llvm.dbg.declare(metadata i64* %i, metadata !106, metadata !DIExpression()), !dbg !108
  store i64 0, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !112
  %cmp1 = icmp ult i64 %3, 100, !dbg !114
  br i1 %cmp1, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !118
  %5 = load i32, i32* %arrayidx, align 4, !dbg !118
  %6 = load i32*, i32** %data, align 8, !dbg !119
  %7 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !119
  store i32 %5, i32* %arrayidx2, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %8, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !127
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !127
  call void @printIntLine(i32 %10), !dbg !128
  %11 = load i32*, i32** %data, align 8, !dbg !129
  %12 = bitcast i32* %11 to i8*, !dbg !129
  call void @free(i8* %12) #6, !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !132 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !133, metadata !DIExpression()), !dbg !134
  store i32* null, i32** %data, align 8, !dbg !135
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !136
  %0 = bitcast i8* %call to i32*, !dbg !137
  store i32* %0, i32** %data, align 8, !dbg !138
  %1 = load i32*, i32** %data, align 8, !dbg !139
  %cmp = icmp eq i32* %1, null, !dbg !141
  br i1 %cmp, label %if.then, label %if.end, !dbg !142

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !145, metadata !DIExpression()), !dbg !147
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !147
  call void @llvm.dbg.declare(metadata i64* %i, metadata !148, metadata !DIExpression()), !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !154
  %cmp1 = icmp ult i64 %3, 100, !dbg !156
  br i1 %cmp1, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !160
  %5 = load i32, i32* %arrayidx, align 4, !dbg !160
  %6 = load i32*, i32** %data, align 8, !dbg !161
  %7 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !161
  store i32 %5, i32* %arrayidx2, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %8, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !169
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !169
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !169
  call void @printIntLine(i32 %10), !dbg !170
  %11 = load i32*, i32** %data, align 8, !dbg !171
  %12 = bitcast i32* %11 to i8*, !dbg !171
  call void @free(i8* %12) #6, !dbg !172
  ret void, !dbg !173
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
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_15_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_15.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 29, column: 23, scope: !14)
!22 = !DILocation(line: 29, column: 16, scope: !14)
!23 = !DILocation(line: 29, column: 14, scope: !14)
!24 = !DILocation(line: 30, column: 13, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 13)
!26 = !DILocation(line: 30, column: 18, scope: !25)
!27 = !DILocation(line: 30, column: 13, scope: !14)
!28 = !DILocation(line: 30, column: 28, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 30, column: 27)
!30 = !DILocalVariable(name: "source", scope: !31, file: !15, line: 38, type: !32)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 38, column: 13, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !15, line: 40, type: !38)
!37 = distinct !DILexicalBlock(scope: !31, file: !15, line: 39, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 40, column: 20, scope: !37)
!42 = !DILocation(line: 42, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !15, line: 42, column: 13)
!44 = !DILocation(line: 42, column: 18, scope: !43)
!45 = !DILocation(line: 42, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !15, line: 42, column: 13)
!47 = !DILocation(line: 42, column: 27, scope: !46)
!48 = !DILocation(line: 42, column: 13, scope: !43)
!49 = !DILocation(line: 44, column: 34, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 43, column: 13)
!51 = !DILocation(line: 44, column: 27, scope: !50)
!52 = !DILocation(line: 44, column: 17, scope: !50)
!53 = !DILocation(line: 44, column: 22, scope: !50)
!54 = !DILocation(line: 44, column: 25, scope: !50)
!55 = !DILocation(line: 45, column: 13, scope: !50)
!56 = !DILocation(line: 42, column: 35, scope: !46)
!57 = !DILocation(line: 42, column: 13, scope: !46)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 45, column: 13, scope: !43)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 46, column: 26, scope: !37)
!62 = !DILocation(line: 46, column: 13, scope: !37)
!63 = !DILocation(line: 47, column: 18, scope: !37)
!64 = !DILocation(line: 47, column: 13, scope: !37)
!65 = !DILocation(line: 50, column: 1, scope: !14)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_15_good", scope: !15, file: !15, line: 120, type: !16, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 122, column: 5, scope: !66)
!68 = !DILocation(line: 123, column: 5, scope: !66)
!69 = !DILocation(line: 124, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 136, type: !71, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!5, !5, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !15, line: 136, type: !5)
!77 = !DILocation(line: 136, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !15, line: 136, type: !73)
!79 = !DILocation(line: 136, column: 27, scope: !70)
!80 = !DILocation(line: 139, column: 22, scope: !70)
!81 = !DILocation(line: 139, column: 12, scope: !70)
!82 = !DILocation(line: 139, column: 5, scope: !70)
!83 = !DILocation(line: 141, column: 5, scope: !70)
!84 = !DILocation(line: 142, column: 5, scope: !70)
!85 = !DILocation(line: 143, column: 5, scope: !70)
!86 = !DILocation(line: 146, column: 5, scope: !70)
!87 = !DILocation(line: 147, column: 5, scope: !70)
!88 = !DILocation(line: 148, column: 5, scope: !70)
!89 = !DILocation(line: 150, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !15, line: 59, type: !4)
!92 = !DILocation(line: 59, column: 11, scope: !90)
!93 = !DILocation(line: 60, column: 10, scope: !90)
!94 = !DILocation(line: 69, column: 23, scope: !90)
!95 = !DILocation(line: 69, column: 16, scope: !90)
!96 = !DILocation(line: 69, column: 14, scope: !90)
!97 = !DILocation(line: 70, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !90, file: !15, line: 70, column: 13)
!99 = !DILocation(line: 70, column: 18, scope: !98)
!100 = !DILocation(line: 70, column: 13, scope: !90)
!101 = !DILocation(line: 70, column: 28, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 70, column: 27)
!103 = !DILocalVariable(name: "source", scope: !104, file: !15, line: 74, type: !32)
!104 = distinct !DILexicalBlock(scope: !90, file: !15, line: 73, column: 5)
!105 = !DILocation(line: 74, column: 13, scope: !104)
!106 = !DILocalVariable(name: "i", scope: !107, file: !15, line: 76, type: !38)
!107 = distinct !DILexicalBlock(scope: !104, file: !15, line: 75, column: 9)
!108 = !DILocation(line: 76, column: 20, scope: !107)
!109 = !DILocation(line: 78, column: 20, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !15, line: 78, column: 13)
!111 = !DILocation(line: 78, column: 18, scope: !110)
!112 = !DILocation(line: 78, column: 25, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !15, line: 78, column: 13)
!114 = !DILocation(line: 78, column: 27, scope: !113)
!115 = !DILocation(line: 78, column: 13, scope: !110)
!116 = !DILocation(line: 80, column: 34, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 79, column: 13)
!118 = !DILocation(line: 80, column: 27, scope: !117)
!119 = !DILocation(line: 80, column: 17, scope: !117)
!120 = !DILocation(line: 80, column: 22, scope: !117)
!121 = !DILocation(line: 80, column: 25, scope: !117)
!122 = !DILocation(line: 81, column: 13, scope: !117)
!123 = !DILocation(line: 78, column: 35, scope: !113)
!124 = !DILocation(line: 78, column: 13, scope: !113)
!125 = distinct !{!125, !115, !126, !60}
!126 = !DILocation(line: 81, column: 13, scope: !110)
!127 = !DILocation(line: 82, column: 26, scope: !107)
!128 = !DILocation(line: 82, column: 13, scope: !107)
!129 = !DILocation(line: 83, column: 18, scope: !107)
!130 = !DILocation(line: 83, column: 13, scope: !107)
!131 = !DILocation(line: 86, column: 1, scope: !90)
!132 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 89, type: !16, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocalVariable(name: "data", scope: !132, file: !15, line: 91, type: !4)
!134 = !DILocation(line: 91, column: 11, scope: !132)
!135 = !DILocation(line: 92, column: 10, scope: !132)
!136 = !DILocation(line: 97, column: 23, scope: !132)
!137 = !DILocation(line: 97, column: 16, scope: !132)
!138 = !DILocation(line: 97, column: 14, scope: !132)
!139 = !DILocation(line: 98, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !132, file: !15, line: 98, column: 13)
!141 = !DILocation(line: 98, column: 18, scope: !140)
!142 = !DILocation(line: 98, column: 13, scope: !132)
!143 = !DILocation(line: 98, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !15, line: 98, column: 27)
!145 = !DILocalVariable(name: "source", scope: !146, file: !15, line: 106, type: !32)
!146 = distinct !DILexicalBlock(scope: !132, file: !15, line: 105, column: 5)
!147 = !DILocation(line: 106, column: 13, scope: !146)
!148 = !DILocalVariable(name: "i", scope: !149, file: !15, line: 108, type: !38)
!149 = distinct !DILexicalBlock(scope: !146, file: !15, line: 107, column: 9)
!150 = !DILocation(line: 108, column: 20, scope: !149)
!151 = !DILocation(line: 110, column: 20, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !15, line: 110, column: 13)
!153 = !DILocation(line: 110, column: 18, scope: !152)
!154 = !DILocation(line: 110, column: 25, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !15, line: 110, column: 13)
!156 = !DILocation(line: 110, column: 27, scope: !155)
!157 = !DILocation(line: 110, column: 13, scope: !152)
!158 = !DILocation(line: 112, column: 34, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !15, line: 111, column: 13)
!160 = !DILocation(line: 112, column: 27, scope: !159)
!161 = !DILocation(line: 112, column: 17, scope: !159)
!162 = !DILocation(line: 112, column: 22, scope: !159)
!163 = !DILocation(line: 112, column: 25, scope: !159)
!164 = !DILocation(line: 113, column: 13, scope: !159)
!165 = !DILocation(line: 110, column: 35, scope: !155)
!166 = !DILocation(line: 110, column: 13, scope: !155)
!167 = distinct !{!167, !157, !168, !60}
!168 = !DILocation(line: 113, column: 13, scope: !152)
!169 = !DILocation(line: 114, column: 26, scope: !149)
!170 = !DILocation(line: 114, column: 13, scope: !149)
!171 = !DILocation(line: 115, column: 18, scope: !149)
!172 = !DILocation(line: 115, column: 13, scope: !149)
!173 = !DILocation(line: 118, column: 1, scope: !132)
