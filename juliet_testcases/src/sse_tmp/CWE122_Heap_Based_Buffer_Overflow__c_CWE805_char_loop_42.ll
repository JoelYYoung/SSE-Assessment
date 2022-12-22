; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call = call i8* @badSource(i8* %0), !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !35
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %1, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !47
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  %5 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !48
  store i8 %3, i8* %arrayidx2, align 1, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %6, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !57
  store i8 0, i8* %arrayidx3, align 1, !dbg !58
  %8 = load i8*, i8** %data, align 8, !dbg !59
  call void @printLine(i8* %8), !dbg !60
  %9 = load i8*, i8** %data, align 8, !dbg !61
  call void @free(i8* %9) #6, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !64 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !69
  store i8* %call, i8** %data.addr, align 8, !dbg !70
  %0 = load i8*, i8** %data.addr, align 8, !dbg !71
  %cmp = icmp eq i8* %0, null, !dbg !73
  br i1 %cmp, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  %2 = load i8*, i8** %data.addr, align 8, !dbg !79
  ret i8* %2, !dbg !80
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_42_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #6, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #6, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_42_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_42_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  %call = call i8* @goodG2BSource(i8* %0), !dbg !108
  store i8* %call, i8** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !121
  %cmp = icmp ult i64 %1, 100, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !127
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !127
  %4 = load i8*, i8** %data, align 8, !dbg !128
  %5 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !128
  store i8 %3, i8* %arrayidx2, align 1, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %6, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !136
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !136
  store i8 0, i8* %arrayidx3, align 1, !dbg !137
  %8 = load i8*, i8** %data, align 8, !dbg !138
  call void @printLine(i8* %8), !dbg !139
  %9 = load i8*, i8** %data, align 8, !dbg !140
  call void @free(i8* %9) #6, !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !143 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !144, metadata !DIExpression()), !dbg !145
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !146
  store i8* %call, i8** %data.addr, align 8, !dbg !147
  %0 = load i8*, i8** %data.addr, align 8, !dbg !148
  %cmp = icmp eq i8* %0, null, !dbg !150
  br i1 %cmp, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !152
  unreachable, !dbg !152

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !154
  store i8 0, i8* %arrayidx, align 1, !dbg !155
  %2 = load i8*, i8** %data.addr, align 8, !dbg !156
  ret i8* %2, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_42_bad", scope: !15, file: !15, line: 32, type: !16, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_42.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 34, type: !5)
!19 = !DILocation(line: 34, column: 12, scope: !14)
!20 = !DILocation(line: 35, column: 10, scope: !14)
!21 = !DILocation(line: 36, column: 22, scope: !14)
!22 = !DILocation(line: 36, column: 12, scope: !14)
!23 = !DILocation(line: 36, column: 10, scope: !14)
!24 = !DILocalVariable(name: "i", scope: !25, file: !15, line: 38, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 46, baseType: !28)
!27 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 38, column: 16, scope: !25)
!30 = !DILocalVariable(name: "source", scope: !25, file: !15, line: 39, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 39, column: 14, scope: !25)
!35 = !DILocation(line: 40, column: 9, scope: !25)
!36 = !DILocation(line: 41, column: 9, scope: !25)
!37 = !DILocation(line: 41, column: 23, scope: !25)
!38 = !DILocation(line: 43, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !25, file: !15, line: 43, column: 9)
!40 = !DILocation(line: 43, column: 14, scope: !39)
!41 = !DILocation(line: 43, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !15, line: 43, column: 9)
!43 = !DILocation(line: 43, column: 23, scope: !42)
!44 = !DILocation(line: 43, column: 9, scope: !39)
!45 = !DILocation(line: 45, column: 30, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 44, column: 9)
!47 = !DILocation(line: 45, column: 23, scope: !46)
!48 = !DILocation(line: 45, column: 13, scope: !46)
!49 = !DILocation(line: 45, column: 18, scope: !46)
!50 = !DILocation(line: 45, column: 21, scope: !46)
!51 = !DILocation(line: 46, column: 9, scope: !46)
!52 = !DILocation(line: 43, column: 31, scope: !42)
!53 = !DILocation(line: 43, column: 9, scope: !42)
!54 = distinct !{!54, !44, !55, !56}
!55 = !DILocation(line: 46, column: 9, scope: !39)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 47, column: 9, scope: !25)
!58 = !DILocation(line: 47, column: 21, scope: !25)
!59 = !DILocation(line: 48, column: 19, scope: !25)
!60 = !DILocation(line: 48, column: 9, scope: !25)
!61 = !DILocation(line: 49, column: 14, scope: !25)
!62 = !DILocation(line: 49, column: 9, scope: !25)
!63 = !DILocation(line: 51, column: 1, scope: !14)
!64 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !65, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!5, !5}
!67 = !DILocalVariable(name: "data", arg: 1, scope: !64, file: !15, line: 23, type: !5)
!68 = !DILocation(line: 23, column: 32, scope: !64)
!69 = !DILocation(line: 26, column: 20, scope: !64)
!70 = !DILocation(line: 26, column: 10, scope: !64)
!71 = !DILocation(line: 27, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !64, file: !15, line: 27, column: 9)
!73 = !DILocation(line: 27, column: 14, scope: !72)
!74 = !DILocation(line: 27, column: 9, scope: !64)
!75 = !DILocation(line: 27, column: 24, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 27, column: 23)
!77 = !DILocation(line: 28, column: 5, scope: !64)
!78 = !DILocation(line: 28, column: 13, scope: !64)
!79 = !DILocation(line: 29, column: 12, scope: !64)
!80 = !DILocation(line: 29, column: 5, scope: !64)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_42_good", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 90, column: 5, scope: !81)
!83 = !DILocation(line: 91, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 103, type: !85, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !15, line: 103, type: !87)
!90 = !DILocation(line: 103, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !15, line: 103, type: !88)
!92 = !DILocation(line: 103, column: 27, scope: !84)
!93 = !DILocation(line: 106, column: 22, scope: !84)
!94 = !DILocation(line: 106, column: 12, scope: !84)
!95 = !DILocation(line: 106, column: 5, scope: !84)
!96 = !DILocation(line: 108, column: 5, scope: !84)
!97 = !DILocation(line: 109, column: 5, scope: !84)
!98 = !DILocation(line: 110, column: 5, scope: !84)
!99 = !DILocation(line: 113, column: 5, scope: !84)
!100 = !DILocation(line: 114, column: 5, scope: !84)
!101 = !DILocation(line: 115, column: 5, scope: !84)
!102 = !DILocation(line: 117, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 67, type: !16, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 69, type: !5)
!105 = !DILocation(line: 69, column: 12, scope: !103)
!106 = !DILocation(line: 70, column: 10, scope: !103)
!107 = !DILocation(line: 71, column: 26, scope: !103)
!108 = !DILocation(line: 71, column: 12, scope: !103)
!109 = !DILocation(line: 71, column: 10, scope: !103)
!110 = !DILocalVariable(name: "i", scope: !111, file: !15, line: 73, type: !26)
!111 = distinct !DILexicalBlock(scope: !103, file: !15, line: 72, column: 5)
!112 = !DILocation(line: 73, column: 16, scope: !111)
!113 = !DILocalVariable(name: "source", scope: !111, file: !15, line: 74, type: !31)
!114 = !DILocation(line: 74, column: 14, scope: !111)
!115 = !DILocation(line: 75, column: 9, scope: !111)
!116 = !DILocation(line: 76, column: 9, scope: !111)
!117 = !DILocation(line: 76, column: 23, scope: !111)
!118 = !DILocation(line: 78, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !15, line: 78, column: 9)
!120 = !DILocation(line: 78, column: 14, scope: !119)
!121 = !DILocation(line: 78, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !15, line: 78, column: 9)
!123 = !DILocation(line: 78, column: 23, scope: !122)
!124 = !DILocation(line: 78, column: 9, scope: !119)
!125 = !DILocation(line: 80, column: 30, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 79, column: 9)
!127 = !DILocation(line: 80, column: 23, scope: !126)
!128 = !DILocation(line: 80, column: 13, scope: !126)
!129 = !DILocation(line: 80, column: 18, scope: !126)
!130 = !DILocation(line: 80, column: 21, scope: !126)
!131 = !DILocation(line: 81, column: 9, scope: !126)
!132 = !DILocation(line: 78, column: 31, scope: !122)
!133 = !DILocation(line: 78, column: 9, scope: !122)
!134 = distinct !{!134, !124, !135, !56}
!135 = !DILocation(line: 81, column: 9, scope: !119)
!136 = !DILocation(line: 82, column: 9, scope: !111)
!137 = !DILocation(line: 82, column: 21, scope: !111)
!138 = !DILocation(line: 83, column: 19, scope: !111)
!139 = !DILocation(line: 83, column: 9, scope: !111)
!140 = !DILocation(line: 84, column: 14, scope: !111)
!141 = !DILocation(line: 84, column: 9, scope: !111)
!142 = !DILocation(line: 86, column: 1, scope: !103)
!143 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 57, type: !65, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocalVariable(name: "data", arg: 1, scope: !143, file: !15, line: 57, type: !5)
!145 = !DILocation(line: 57, column: 36, scope: !143)
!146 = !DILocation(line: 60, column: 20, scope: !143)
!147 = !DILocation(line: 60, column: 10, scope: !143)
!148 = !DILocation(line: 61, column: 9, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !15, line: 61, column: 9)
!150 = !DILocation(line: 61, column: 14, scope: !149)
!151 = !DILocation(line: 61, column: 9, scope: !143)
!152 = !DILocation(line: 61, column: 24, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !15, line: 61, column: 23)
!154 = !DILocation(line: 62, column: 5, scope: !143)
!155 = !DILocation(line: 62, column: 13, scope: !143)
!156 = !DILocation(line: 63, column: 12, scope: !143)
!157 = !DILocation(line: 63, column: 5, scope: !143)
