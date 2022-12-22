; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end8, !dbg !38

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !39
  %3 = bitcast i8* %call3 to i32*, !dbg !41
  store i32* %3, i32** %data, align 8, !dbg !42
  %4 = load i32*, i32** %data, align 8, !dbg !43
  %cmp4 = icmp eq i32* %4, null, !dbg !45
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !46

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !47
  unreachable, !dbg !47

if.end6:                                          ; preds = %if.else
  %5 = load i32*, i32** %data, align 8, !dbg !49
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 0, !dbg !49
  store i32 0, i32* %arrayidx7, align 4, !dbg !50
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !56, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %call9 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !62
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx10, align 4, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.end8
  %6 = load i64, i64* %i, align 8, !dbg !68
  %cmp11 = icmp ult i64 %6, 100, !dbg !70
  br i1 %cmp11, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !74
  %8 = load i32, i32* %arrayidx12, align 4, !dbg !74
  %9 = load i32*, i32** %data, align 8, !dbg !75
  %10 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx13 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !75
  store i32 %8, i32* %arrayidx13, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %11, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !84
  store i32 0, i32* %arrayidx14, align 4, !dbg !85
  %13 = load i32*, i32** %data, align 8, !dbg !86
  call void @printWLine(i32* %13), !dbg !87
  %14 = load i32*, i32** %data, align 8, !dbg !88
  %15 = bitcast i32* %14 to i8*, !dbg !88
  call void @free(i8* %15) #5, !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_12_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #5, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #5, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_12_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_12_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i32* null, i32** %data, align 8, !dbg !117
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !118
  %tobool = icmp ne i32 %call, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !121
  %0 = bitcast i8* %call1 to i32*, !dbg !123
  store i32* %0, i32** %data, align 8, !dbg !124
  %1 = load i32*, i32** %data, align 8, !dbg !125
  %cmp = icmp eq i32* %1, null, !dbg !127
  br i1 %cmp, label %if.then2, label %if.end, !dbg !128

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  br label %if.end8, !dbg !133

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !134
  %3 = bitcast i8* %call3 to i32*, !dbg !136
  store i32* %3, i32** %data, align 8, !dbg !137
  %4 = load i32*, i32** %data, align 8, !dbg !138
  %cmp4 = icmp eq i32* %4, null, !dbg !140
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !141

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !142
  unreachable, !dbg !142

if.end6:                                          ; preds = %if.else
  %5 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 0, !dbg !144
  store i32 0, i32* %arrayidx7, align 4, !dbg !145
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !149, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !151
  %call9 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !152
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !153
  store i32 0, i32* %arrayidx10, align 4, !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %if.end8
  %6 = load i64, i64* %i, align 8, !dbg !158
  %cmp11 = icmp ult i64 %6, 100, !dbg !160
  br i1 %cmp11, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !164
  %8 = load i32, i32* %arrayidx12, align 4, !dbg !164
  %9 = load i32*, i32** %data, align 8, !dbg !165
  %10 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx13 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !165
  store i32 %8, i32* %arrayidx13, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %11, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !173
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !173
  store i32 0, i32* %arrayidx14, align 4, !dbg !174
  %13 = load i32*, i32** %data, align 8, !dbg !175
  call void @printWLine(i32* %13), !dbg !176
  %14 = load i32*, i32** %data, align 8, !dbg !177
  %15 = bitcast i32* %14 to i8*, !dbg !177
  call void @free(i8* %15) #5, !dbg !178
  ret void, !dbg !179
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_12_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_12.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 14, scope: !27)
!30 = !DILocation(line: 31, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 13)
!32 = !DILocation(line: 31, column: 18, scope: !31)
!33 = !DILocation(line: 31, column: 13, scope: !27)
!34 = !DILocation(line: 31, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 31, column: 27)
!36 = !DILocation(line: 32, column: 9, scope: !27)
!37 = !DILocation(line: 32, column: 17, scope: !27)
!38 = !DILocation(line: 33, column: 5, scope: !27)
!39 = !DILocation(line: 37, column: 27, scope: !40)
!40 = distinct !DILexicalBlock(scope: !24, file: !17, line: 35, column: 5)
!41 = !DILocation(line: 37, column: 16, scope: !40)
!42 = !DILocation(line: 37, column: 14, scope: !40)
!43 = !DILocation(line: 38, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !17, line: 38, column: 13)
!45 = !DILocation(line: 38, column: 18, scope: !44)
!46 = !DILocation(line: 38, column: 13, scope: !40)
!47 = !DILocation(line: 38, column: 28, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !17, line: 38, column: 27)
!49 = !DILocation(line: 39, column: 9, scope: !40)
!50 = !DILocation(line: 39, column: 17, scope: !40)
!51 = !DILocalVariable(name: "i", scope: !52, file: !17, line: 42, type: !53)
!52 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !54)
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 42, column: 16, scope: !52)
!56 = !DILocalVariable(name: "source", scope: !52, file: !17, line: 43, type: !57)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 100)
!60 = !DILocation(line: 43, column: 17, scope: !52)
!61 = !DILocation(line: 44, column: 17, scope: !52)
!62 = !DILocation(line: 44, column: 9, scope: !52)
!63 = !DILocation(line: 45, column: 9, scope: !52)
!64 = !DILocation(line: 45, column: 23, scope: !52)
!65 = !DILocation(line: 47, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !52, file: !17, line: 47, column: 9)
!67 = !DILocation(line: 47, column: 14, scope: !66)
!68 = !DILocation(line: 47, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !17, line: 47, column: 9)
!70 = !DILocation(line: 47, column: 23, scope: !69)
!71 = !DILocation(line: 47, column: 9, scope: !66)
!72 = !DILocation(line: 49, column: 30, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !17, line: 48, column: 9)
!74 = !DILocation(line: 49, column: 23, scope: !73)
!75 = !DILocation(line: 49, column: 13, scope: !73)
!76 = !DILocation(line: 49, column: 18, scope: !73)
!77 = !DILocation(line: 49, column: 21, scope: !73)
!78 = !DILocation(line: 50, column: 9, scope: !73)
!79 = !DILocation(line: 47, column: 31, scope: !69)
!80 = !DILocation(line: 47, column: 9, scope: !69)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 50, column: 9, scope: !66)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 51, column: 9, scope: !52)
!85 = !DILocation(line: 51, column: 21, scope: !52)
!86 = !DILocation(line: 52, column: 20, scope: !52)
!87 = !DILocation(line: 52, column: 9, scope: !52)
!88 = !DILocation(line: 53, column: 14, scope: !52)
!89 = !DILocation(line: 53, column: 9, scope: !52)
!90 = !DILocation(line: 55, column: 1, scope: !16)
!91 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_12_good", scope: !17, file: !17, line: 97, type: !18, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 99, column: 5, scope: !91)
!93 = !DILocation(line: 100, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 112, type: !95, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!7, !7, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !17, line: 112, type: !7)
!101 = !DILocation(line: 112, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !17, line: 112, type: !97)
!103 = !DILocation(line: 112, column: 27, scope: !94)
!104 = !DILocation(line: 115, column: 22, scope: !94)
!105 = !DILocation(line: 115, column: 12, scope: !94)
!106 = !DILocation(line: 115, column: 5, scope: !94)
!107 = !DILocation(line: 117, column: 5, scope: !94)
!108 = !DILocation(line: 118, column: 5, scope: !94)
!109 = !DILocation(line: 119, column: 5, scope: !94)
!110 = !DILocation(line: 122, column: 5, scope: !94)
!111 = !DILocation(line: 123, column: 5, scope: !94)
!112 = !DILocation(line: 124, column: 5, scope: !94)
!113 = !DILocation(line: 126, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 63, type: !18, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !17, line: 65, type: !4)
!116 = !DILocation(line: 65, column: 15, scope: !114)
!117 = !DILocation(line: 66, column: 10, scope: !114)
!118 = !DILocation(line: 67, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !17, line: 67, column: 8)
!120 = !DILocation(line: 67, column: 8, scope: !114)
!121 = !DILocation(line: 70, column: 27, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !17, line: 68, column: 5)
!123 = !DILocation(line: 70, column: 16, scope: !122)
!124 = !DILocation(line: 70, column: 14, scope: !122)
!125 = !DILocation(line: 71, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !17, line: 71, column: 13)
!127 = !DILocation(line: 71, column: 18, scope: !126)
!128 = !DILocation(line: 71, column: 13, scope: !122)
!129 = !DILocation(line: 71, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !17, line: 71, column: 27)
!131 = !DILocation(line: 72, column: 9, scope: !122)
!132 = !DILocation(line: 72, column: 17, scope: !122)
!133 = !DILocation(line: 73, column: 5, scope: !122)
!134 = !DILocation(line: 77, column: 27, scope: !135)
!135 = distinct !DILexicalBlock(scope: !119, file: !17, line: 75, column: 5)
!136 = !DILocation(line: 77, column: 16, scope: !135)
!137 = !DILocation(line: 77, column: 14, scope: !135)
!138 = !DILocation(line: 78, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !17, line: 78, column: 13)
!140 = !DILocation(line: 78, column: 18, scope: !139)
!141 = !DILocation(line: 78, column: 13, scope: !135)
!142 = !DILocation(line: 78, column: 28, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !17, line: 78, column: 27)
!144 = !DILocation(line: 79, column: 9, scope: !135)
!145 = !DILocation(line: 79, column: 17, scope: !135)
!146 = !DILocalVariable(name: "i", scope: !147, file: !17, line: 82, type: !53)
!147 = distinct !DILexicalBlock(scope: !114, file: !17, line: 81, column: 5)
!148 = !DILocation(line: 82, column: 16, scope: !147)
!149 = !DILocalVariable(name: "source", scope: !147, file: !17, line: 83, type: !57)
!150 = !DILocation(line: 83, column: 17, scope: !147)
!151 = !DILocation(line: 84, column: 17, scope: !147)
!152 = !DILocation(line: 84, column: 9, scope: !147)
!153 = !DILocation(line: 85, column: 9, scope: !147)
!154 = !DILocation(line: 85, column: 23, scope: !147)
!155 = !DILocation(line: 87, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !147, file: !17, line: 87, column: 9)
!157 = !DILocation(line: 87, column: 14, scope: !156)
!158 = !DILocation(line: 87, column: 21, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !17, line: 87, column: 9)
!160 = !DILocation(line: 87, column: 23, scope: !159)
!161 = !DILocation(line: 87, column: 9, scope: !156)
!162 = !DILocation(line: 89, column: 30, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !17, line: 88, column: 9)
!164 = !DILocation(line: 89, column: 23, scope: !163)
!165 = !DILocation(line: 89, column: 13, scope: !163)
!166 = !DILocation(line: 89, column: 18, scope: !163)
!167 = !DILocation(line: 89, column: 21, scope: !163)
!168 = !DILocation(line: 90, column: 9, scope: !163)
!169 = !DILocation(line: 87, column: 31, scope: !159)
!170 = !DILocation(line: 87, column: 9, scope: !159)
!171 = distinct !{!171, !161, !172, !83}
!172 = !DILocation(line: 90, column: 9, scope: !156)
!173 = !DILocation(line: 91, column: 9, scope: !147)
!174 = !DILocation(line: 91, column: 21, scope: !147)
!175 = !DILocation(line: 92, column: 20, scope: !147)
!176 = !DILocation(line: 92, column: 9, scope: !147)
!177 = !DILocation(line: 93, column: 14, scope: !147)
!178 = !DILocation(line: 93, column: 9, scope: !147)
!179 = !DILocation(line: 95, column: 1, scope: !114)
