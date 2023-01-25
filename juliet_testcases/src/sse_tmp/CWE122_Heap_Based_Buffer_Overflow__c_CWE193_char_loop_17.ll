; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i2 = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i8* null, i8** %data, align 8, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !33
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %cmp1 = icmp eq i8* %1, null, !dbg !36
  br i1 %cmp1, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %if.end
  %2 = load i32, i32* %i, align 4, !dbg !41
  %inc = add nsw i32 %2, 1, !dbg !41
  store i32 %inc, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !52, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !57, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !59
  %call3 = call i64 @strlen(i8* %arraydecay) #9, !dbg !60
  store i64 %call3, i64* %sourceLen, align 8, !dbg !61
  store i64 0, i64* %i2, align 8, !dbg !62
  br label %for.cond4, !dbg !64

for.cond4:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !65
  %5 = load i64, i64* %sourceLen, align 8, !dbg !67
  %add = add i64 %5, 1, !dbg !68
  %cmp5 = icmp ult i64 %4, %add, !dbg !69
  br i1 %cmp5, label %for.body6, label %for.end10, !dbg !70

for.body6:                                        ; preds = %for.cond4
  %6 = load i64, i64* %i2, align 8, !dbg !71
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !73
  %7 = load i8, i8* %arrayidx, align 1, !dbg !73
  %8 = load i8*, i8** %data, align 8, !dbg !74
  %9 = load i64, i64* %i2, align 8, !dbg !75
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !74
  store i8 %7, i8* %arrayidx7, align 1, !dbg !76
  br label %for.inc8, !dbg !77

for.inc8:                                         ; preds = %for.body6
  %10 = load i64, i64* %i2, align 8, !dbg !78
  %inc9 = add i64 %10, 1, !dbg !78
  store i64 %inc9, i64* %i2, align 8, !dbg !78
  br label %for.cond4, !dbg !79, !llvm.loop !80

for.end10:                                        ; preds = %for.cond4
  %11 = load i8*, i8** %data, align 8, !dbg !82
  call void @printLine(i8* %11), !dbg !83
  %12 = load i8*, i8** %data, align 8, !dbg !84
  call void @free(i8* %12) #7, !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #7, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #7, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  store i8* null, i8** %data, align 8, !dbg !113
  store i32 0, i32* %h, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !117
  %cmp = icmp slt i32 %0, 1, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !121
  store i8* %call, i8** %data, align 8, !dbg !123
  %1 = load i8*, i8** %data, align 8, !dbg !124
  %cmp1 = icmp eq i8* %1, null, !dbg !126
  br i1 %cmp1, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %if.end
  %2 = load i32, i32* %h, align 4, !dbg !131
  %inc = add nsw i32 %2, 1, !dbg !131
  store i32 %inc, i32* %h, align 4, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !135, metadata !DIExpression()), !dbg !137
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !137
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !142
  %call2 = call i64 @strlen(i8* %arraydecay) #9, !dbg !143
  store i64 %call2, i64* %sourceLen, align 8, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond3, !dbg !147

for.cond3:                                        ; preds = %for.inc7, %for.end
  %4 = load i64, i64* %i, align 8, !dbg !148
  %5 = load i64, i64* %sourceLen, align 8, !dbg !150
  %add = add i64 %5, 1, !dbg !151
  %cmp4 = icmp ult i64 %4, %add, !dbg !152
  br i1 %cmp4, label %for.body5, label %for.end9, !dbg !153

for.body5:                                        ; preds = %for.cond3
  %6 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !156
  %7 = load i8, i8* %arrayidx, align 1, !dbg !156
  %8 = load i8*, i8** %data, align 8, !dbg !157
  %9 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !157
  store i8 %7, i8* %arrayidx6, align 1, !dbg !159
  br label %for.inc7, !dbg !160

for.inc7:                                         ; preds = %for.body5
  %10 = load i64, i64* %i, align 8, !dbg !161
  %inc8 = add i64 %10, 1, !dbg !161
  store i64 %inc8, i64* %i, align 8, !dbg !161
  br label %for.cond3, !dbg !162, !llvm.loop !163

for.end9:                                         ; preds = %for.cond3
  %11 = load i8*, i8** %data, align 8, !dbg !165
  call void @printLine(i8* %11), !dbg !166
  %12 = load i8*, i8** %data, align 8, !dbg !167
  call void @free(i8* %12) #7, !dbg !168
  ret void, !dbg !169
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 30, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 12, scope: !14)
!23 = !DILocation(line: 32, column: 10, scope: !14)
!24 = !DILocation(line: 33, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 5)
!26 = !DILocation(line: 33, column: 9, scope: !25)
!27 = !DILocation(line: 33, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 33, column: 5)
!29 = !DILocation(line: 33, column: 18, scope: !28)
!30 = !DILocation(line: 33, column: 5, scope: !25)
!31 = !DILocation(line: 36, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 34, column: 5)
!33 = !DILocation(line: 36, column: 14, scope: !32)
!34 = !DILocation(line: 37, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !15, line: 37, column: 13)
!36 = !DILocation(line: 37, column: 18, scope: !35)
!37 = !DILocation(line: 37, column: 13, scope: !32)
!38 = !DILocation(line: 37, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 37, column: 27)
!40 = !DILocation(line: 38, column: 5, scope: !32)
!41 = !DILocation(line: 33, column: 24, scope: !28)
!42 = !DILocation(line: 33, column: 5, scope: !28)
!43 = distinct !{!43, !30, !44, !45}
!44 = !DILocation(line: 38, column: 5, scope: !25)
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocalVariable(name: "source", scope: !47, file: !15, line: 40, type: !48)
!47 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 11)
!51 = !DILocation(line: 40, column: 14, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !47, file: !15, line: 41, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 41, column: 16, scope: !47)
!57 = !DILocalVariable(name: "sourceLen", scope: !47, file: !15, line: 41, type: !53)
!58 = !DILocation(line: 41, column: 19, scope: !47)
!59 = !DILocation(line: 42, column: 28, scope: !47)
!60 = !DILocation(line: 42, column: 21, scope: !47)
!61 = !DILocation(line: 42, column: 19, scope: !47)
!62 = !DILocation(line: 45, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !47, file: !15, line: 45, column: 9)
!64 = !DILocation(line: 45, column: 14, scope: !63)
!65 = !DILocation(line: 45, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !15, line: 45, column: 9)
!67 = !DILocation(line: 45, column: 25, scope: !66)
!68 = !DILocation(line: 45, column: 35, scope: !66)
!69 = !DILocation(line: 45, column: 23, scope: !66)
!70 = !DILocation(line: 45, column: 9, scope: !63)
!71 = !DILocation(line: 47, column: 30, scope: !72)
!72 = distinct !DILexicalBlock(scope: !66, file: !15, line: 46, column: 9)
!73 = !DILocation(line: 47, column: 23, scope: !72)
!74 = !DILocation(line: 47, column: 13, scope: !72)
!75 = !DILocation(line: 47, column: 18, scope: !72)
!76 = !DILocation(line: 47, column: 21, scope: !72)
!77 = !DILocation(line: 48, column: 9, scope: !72)
!78 = !DILocation(line: 45, column: 41, scope: !66)
!79 = !DILocation(line: 45, column: 9, scope: !66)
!80 = distinct !{!80, !70, !81, !45}
!81 = !DILocation(line: 48, column: 9, scope: !63)
!82 = !DILocation(line: 49, column: 19, scope: !47)
!83 = !DILocation(line: 49, column: 9, scope: !47)
!84 = !DILocation(line: 50, column: 14, scope: !47)
!85 = !DILocation(line: 50, column: 9, scope: !47)
!86 = !DILocation(line: 52, column: 1, scope: !14)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_17_good", scope: !15, file: !15, line: 85, type: !16, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 87, column: 5, scope: !87)
!89 = !DILocation(line: 88, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 100, type: !91, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!19, !19, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !15, line: 100, type: !19)
!95 = !DILocation(line: 100, column: 14, scope: !90)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !15, line: 100, type: !93)
!97 = !DILocation(line: 100, column: 27, scope: !90)
!98 = !DILocation(line: 103, column: 22, scope: !90)
!99 = !DILocation(line: 103, column: 12, scope: !90)
!100 = !DILocation(line: 103, column: 5, scope: !90)
!101 = !DILocation(line: 105, column: 5, scope: !90)
!102 = !DILocation(line: 106, column: 5, scope: !90)
!103 = !DILocation(line: 107, column: 5, scope: !90)
!104 = !DILocation(line: 110, column: 5, scope: !90)
!105 = !DILocation(line: 111, column: 5, scope: !90)
!106 = !DILocation(line: 112, column: 5, scope: !90)
!107 = !DILocation(line: 114, column: 5, scope: !90)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "h", scope: !108, file: !15, line: 61, type: !19)
!110 = !DILocation(line: 61, column: 9, scope: !108)
!111 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 62, type: !4)
!112 = !DILocation(line: 62, column: 12, scope: !108)
!113 = !DILocation(line: 63, column: 10, scope: !108)
!114 = !DILocation(line: 64, column: 11, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !15, line: 64, column: 5)
!116 = !DILocation(line: 64, column: 9, scope: !115)
!117 = !DILocation(line: 64, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !15, line: 64, column: 5)
!119 = !DILocation(line: 64, column: 18, scope: !118)
!120 = !DILocation(line: 64, column: 5, scope: !115)
!121 = !DILocation(line: 67, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 65, column: 5)
!123 = !DILocation(line: 67, column: 14, scope: !122)
!124 = !DILocation(line: 68, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !15, line: 68, column: 13)
!126 = !DILocation(line: 68, column: 18, scope: !125)
!127 = !DILocation(line: 68, column: 13, scope: !122)
!128 = !DILocation(line: 68, column: 28, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 68, column: 27)
!130 = !DILocation(line: 69, column: 5, scope: !122)
!131 = !DILocation(line: 64, column: 24, scope: !118)
!132 = !DILocation(line: 64, column: 5, scope: !118)
!133 = distinct !{!133, !120, !134, !45}
!134 = !DILocation(line: 69, column: 5, scope: !115)
!135 = !DILocalVariable(name: "source", scope: !136, file: !15, line: 71, type: !48)
!136 = distinct !DILexicalBlock(scope: !108, file: !15, line: 70, column: 5)
!137 = !DILocation(line: 71, column: 14, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !136, file: !15, line: 72, type: !53)
!139 = !DILocation(line: 72, column: 16, scope: !136)
!140 = !DILocalVariable(name: "sourceLen", scope: !136, file: !15, line: 72, type: !53)
!141 = !DILocation(line: 72, column: 19, scope: !136)
!142 = !DILocation(line: 73, column: 28, scope: !136)
!143 = !DILocation(line: 73, column: 21, scope: !136)
!144 = !DILocation(line: 73, column: 19, scope: !136)
!145 = !DILocation(line: 76, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !136, file: !15, line: 76, column: 9)
!147 = !DILocation(line: 76, column: 14, scope: !146)
!148 = !DILocation(line: 76, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !15, line: 76, column: 9)
!150 = !DILocation(line: 76, column: 25, scope: !149)
!151 = !DILocation(line: 76, column: 35, scope: !149)
!152 = !DILocation(line: 76, column: 23, scope: !149)
!153 = !DILocation(line: 76, column: 9, scope: !146)
!154 = !DILocation(line: 78, column: 30, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !15, line: 77, column: 9)
!156 = !DILocation(line: 78, column: 23, scope: !155)
!157 = !DILocation(line: 78, column: 13, scope: !155)
!158 = !DILocation(line: 78, column: 18, scope: !155)
!159 = !DILocation(line: 78, column: 21, scope: !155)
!160 = !DILocation(line: 79, column: 9, scope: !155)
!161 = !DILocation(line: 76, column: 41, scope: !149)
!162 = !DILocation(line: 76, column: 9, scope: !149)
!163 = distinct !{!163, !153, !164, !45}
!164 = !DILocation(line: 79, column: 9, scope: !146)
!165 = !DILocation(line: 80, column: 19, scope: !136)
!166 = !DILocation(line: 80, column: 9, scope: !136)
!167 = !DILocation(line: 81, column: 14, scope: !136)
!168 = !DILocation(line: 81, column: 9, scope: !136)
!169 = !DILocation(line: 83, column: 1, scope: !108)
