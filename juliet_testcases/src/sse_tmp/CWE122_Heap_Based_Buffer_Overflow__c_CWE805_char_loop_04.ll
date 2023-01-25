; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_04.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_04_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx1, align 1, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !50
  %cmp2 = icmp ult i64 %2, 100, !dbg !52
  br i1 %cmp2, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !56
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !56
  %5 = load i8*, i8** %data, align 8, !dbg !57
  %6 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !57
  store i8 %4, i8* %arrayidx4, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %7, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !66
  store i8 0, i8* %arrayidx5, align 1, !dbg !67
  %9 = load i8*, i8** %data, align 8, !dbg !68
  call void @printLine(i8* %9), !dbg !69
  %10 = load i8*, i8** %data, align 8, !dbg !70
  call void @free(i8* %10) #6, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_04_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_04_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_04_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i8* null, i8** %data, align 8, !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  %cmp = icmp eq i8* %0, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !117
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx1, align 1, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !123
  %cmp2 = icmp ult i64 %2, 100, !dbg !125
  br i1 %cmp2, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !129
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !129
  %5 = load i8*, i8** %data, align 8, !dbg !130
  %6 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !130
  store i8 %4, i8* %arrayidx4, align 1, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %7, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !138
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !138
  store i8 0, i8* %arrayidx5, align 1, !dbg !139
  %9 = load i8*, i8** %data, align 8, !dbg !140
  call void @printLine(i8* %9), !dbg !141
  %10 = load i8*, i8** %data, align 8, !dbg !142
  call void @free(i8* %10) #6, !dbg !143
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !146, metadata !DIExpression()), !dbg !147
  store i8* null, i8** %data, align 8, !dbg !148
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !149
  store i8* %call, i8** %data, align 8, !dbg !152
  %0 = load i8*, i8** %data, align 8, !dbg !153
  %cmp = icmp eq i8* %0, null, !dbg !155
  br i1 %cmp, label %if.then, label %if.end, !dbg !156

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !157
  unreachable, !dbg !157

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !159
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !159
  store i8 0, i8* %arrayidx, align 1, !dbg !160
  call void @llvm.dbg.declare(metadata i64* %i, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !164, metadata !DIExpression()), !dbg !165
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !166
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !167
  store i8 0, i8* %arrayidx1, align 1, !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !172
  %cmp2 = icmp ult i64 %2, 100, !dbg !174
  br i1 %cmp2, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !178
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !178
  %5 = load i8*, i8** %data, align 8, !dbg !179
  %6 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !179
  store i8 %4, i8* %arrayidx4, align 1, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !183
  %inc = add i64 %7, 1, !dbg !183
  store i64 %inc, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !187
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !187
  store i8 0, i8* %arrayidx5, align 1, !dbg !188
  %9 = load i8*, i8** %data, align 8, !dbg !189
  call void @printLine(i8* %9), !dbg !190
  %10 = load i8*, i8** %data, align 8, !dbg !191
  call void @free(i8* %10) #6, !dbg !192
  ret void, !dbg !193
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_04_bad", scope: !15, file: !15, line: 30, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 32, type: !4)
!19 = !DILocation(line: 32, column: 12, scope: !14)
!20 = !DILocation(line: 33, column: 10, scope: !14)
!21 = !DILocation(line: 37, column: 24, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 35, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 8)
!24 = !DILocation(line: 37, column: 14, scope: !22)
!25 = !DILocation(line: 38, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 38, column: 13)
!27 = !DILocation(line: 38, column: 18, scope: !26)
!28 = !DILocation(line: 38, column: 13, scope: !22)
!29 = !DILocation(line: 38, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 38, column: 27)
!31 = !DILocation(line: 39, column: 9, scope: !22)
!32 = !DILocation(line: 39, column: 17, scope: !22)
!33 = !DILocalVariable(name: "i", scope: !34, file: !15, line: 42, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 42, column: 16, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !34, file: !15, line: 43, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 43, column: 14, scope: !34)
!44 = !DILocation(line: 44, column: 9, scope: !34)
!45 = !DILocation(line: 45, column: 9, scope: !34)
!46 = !DILocation(line: 45, column: 23, scope: !34)
!47 = !DILocation(line: 47, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !15, line: 47, column: 9)
!49 = !DILocation(line: 47, column: 14, scope: !48)
!50 = !DILocation(line: 47, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !15, line: 47, column: 9)
!52 = !DILocation(line: 47, column: 23, scope: !51)
!53 = !DILocation(line: 47, column: 9, scope: !48)
!54 = !DILocation(line: 49, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 48, column: 9)
!56 = !DILocation(line: 49, column: 23, scope: !55)
!57 = !DILocation(line: 49, column: 13, scope: !55)
!58 = !DILocation(line: 49, column: 18, scope: !55)
!59 = !DILocation(line: 49, column: 21, scope: !55)
!60 = !DILocation(line: 50, column: 9, scope: !55)
!61 = !DILocation(line: 47, column: 31, scope: !51)
!62 = !DILocation(line: 47, column: 9, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 50, column: 9, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 51, column: 9, scope: !34)
!67 = !DILocation(line: 51, column: 21, scope: !34)
!68 = !DILocation(line: 52, column: 19, scope: !34)
!69 = !DILocation(line: 52, column: 9, scope: !34)
!70 = !DILocation(line: 53, column: 14, scope: !34)
!71 = !DILocation(line: 53, column: 9, scope: !34)
!72 = !DILocation(line: 55, column: 1, scope: !14)
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_04_good", scope: !15, file: !15, line: 122, type: !16, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 124, column: 5, scope: !73)
!75 = !DILocation(line: 125, column: 5, scope: !73)
!76 = !DILocation(line: 126, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 138, type: !78, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !15, line: 138, type: !80)
!83 = !DILocation(line: 138, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !15, line: 138, type: !81)
!85 = !DILocation(line: 138, column: 27, scope: !77)
!86 = !DILocation(line: 141, column: 22, scope: !77)
!87 = !DILocation(line: 141, column: 12, scope: !77)
!88 = !DILocation(line: 141, column: 5, scope: !77)
!89 = !DILocation(line: 143, column: 5, scope: !77)
!90 = !DILocation(line: 144, column: 5, scope: !77)
!91 = !DILocation(line: 145, column: 5, scope: !77)
!92 = !DILocation(line: 148, column: 5, scope: !77)
!93 = !DILocation(line: 149, column: 5, scope: !77)
!94 = !DILocation(line: 150, column: 5, scope: !77)
!95 = !DILocation(line: 152, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 64, type: !4)
!98 = !DILocation(line: 64, column: 12, scope: !96)
!99 = !DILocation(line: 65, column: 10, scope: !96)
!100 = !DILocation(line: 74, column: 24, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !15, line: 72, column: 5)
!102 = distinct !DILexicalBlock(scope: !96, file: !15, line: 66, column: 8)
!103 = !DILocation(line: 74, column: 14, scope: !101)
!104 = !DILocation(line: 75, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 75, column: 13)
!106 = !DILocation(line: 75, column: 18, scope: !105)
!107 = !DILocation(line: 75, column: 13, scope: !101)
!108 = !DILocation(line: 75, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 75, column: 27)
!110 = !DILocation(line: 76, column: 9, scope: !101)
!111 = !DILocation(line: 76, column: 17, scope: !101)
!112 = !DILocalVariable(name: "i", scope: !113, file: !15, line: 79, type: !35)
!113 = distinct !DILexicalBlock(scope: !96, file: !15, line: 78, column: 5)
!114 = !DILocation(line: 79, column: 16, scope: !113)
!115 = !DILocalVariable(name: "source", scope: !113, file: !15, line: 80, type: !40)
!116 = !DILocation(line: 80, column: 14, scope: !113)
!117 = !DILocation(line: 81, column: 9, scope: !113)
!118 = !DILocation(line: 82, column: 9, scope: !113)
!119 = !DILocation(line: 82, column: 23, scope: !113)
!120 = !DILocation(line: 84, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !113, file: !15, line: 84, column: 9)
!122 = !DILocation(line: 84, column: 14, scope: !121)
!123 = !DILocation(line: 84, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !15, line: 84, column: 9)
!125 = !DILocation(line: 84, column: 23, scope: !124)
!126 = !DILocation(line: 84, column: 9, scope: !121)
!127 = !DILocation(line: 86, column: 30, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 85, column: 9)
!129 = !DILocation(line: 86, column: 23, scope: !128)
!130 = !DILocation(line: 86, column: 13, scope: !128)
!131 = !DILocation(line: 86, column: 18, scope: !128)
!132 = !DILocation(line: 86, column: 21, scope: !128)
!133 = !DILocation(line: 87, column: 9, scope: !128)
!134 = !DILocation(line: 84, column: 31, scope: !124)
!135 = !DILocation(line: 84, column: 9, scope: !124)
!136 = distinct !{!136, !126, !137, !65}
!137 = !DILocation(line: 87, column: 9, scope: !121)
!138 = !DILocation(line: 88, column: 9, scope: !113)
!139 = !DILocation(line: 88, column: 21, scope: !113)
!140 = !DILocation(line: 89, column: 19, scope: !113)
!141 = !DILocation(line: 89, column: 9, scope: !113)
!142 = !DILocation(line: 90, column: 14, scope: !113)
!143 = !DILocation(line: 90, column: 9, scope: !113)
!144 = !DILocation(line: 92, column: 1, scope: !96)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 95, type: !16, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !15, line: 97, type: !4)
!147 = !DILocation(line: 97, column: 12, scope: !145)
!148 = !DILocation(line: 98, column: 10, scope: !145)
!149 = !DILocation(line: 102, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !151, file: !15, line: 100, column: 5)
!151 = distinct !DILexicalBlock(scope: !145, file: !15, line: 99, column: 8)
!152 = !DILocation(line: 102, column: 14, scope: !150)
!153 = !DILocation(line: 103, column: 13, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !15, line: 103, column: 13)
!155 = !DILocation(line: 103, column: 18, scope: !154)
!156 = !DILocation(line: 103, column: 13, scope: !150)
!157 = !DILocation(line: 103, column: 28, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 103, column: 27)
!159 = !DILocation(line: 104, column: 9, scope: !150)
!160 = !DILocation(line: 104, column: 17, scope: !150)
!161 = !DILocalVariable(name: "i", scope: !162, file: !15, line: 107, type: !35)
!162 = distinct !DILexicalBlock(scope: !145, file: !15, line: 106, column: 5)
!163 = !DILocation(line: 107, column: 16, scope: !162)
!164 = !DILocalVariable(name: "source", scope: !162, file: !15, line: 108, type: !40)
!165 = !DILocation(line: 108, column: 14, scope: !162)
!166 = !DILocation(line: 109, column: 9, scope: !162)
!167 = !DILocation(line: 110, column: 9, scope: !162)
!168 = !DILocation(line: 110, column: 23, scope: !162)
!169 = !DILocation(line: 112, column: 16, scope: !170)
!170 = distinct !DILexicalBlock(scope: !162, file: !15, line: 112, column: 9)
!171 = !DILocation(line: 112, column: 14, scope: !170)
!172 = !DILocation(line: 112, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !15, line: 112, column: 9)
!174 = !DILocation(line: 112, column: 23, scope: !173)
!175 = !DILocation(line: 112, column: 9, scope: !170)
!176 = !DILocation(line: 114, column: 30, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !15, line: 113, column: 9)
!178 = !DILocation(line: 114, column: 23, scope: !177)
!179 = !DILocation(line: 114, column: 13, scope: !177)
!180 = !DILocation(line: 114, column: 18, scope: !177)
!181 = !DILocation(line: 114, column: 21, scope: !177)
!182 = !DILocation(line: 115, column: 9, scope: !177)
!183 = !DILocation(line: 112, column: 31, scope: !173)
!184 = !DILocation(line: 112, column: 9, scope: !173)
!185 = distinct !{!185, !175, !186, !65}
!186 = !DILocation(line: 115, column: 9, scope: !170)
!187 = !DILocation(line: 116, column: 9, scope: !162)
!188 = !DILocation(line: 116, column: 21, scope: !162)
!189 = !DILocation(line: 117, column: 19, scope: !162)
!190 = !DILocation(line: 117, column: 9, scope: !162)
!191 = !DILocation(line: 118, column: 14, scope: !162)
!192 = !DILocation(line: 118, column: 9, scope: !162)
!193 = !DILocation(line: 120, column: 1, scope: !145)
