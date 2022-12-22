; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !40, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx2, align 1, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !51
  %cmp3 = icmp ult i64 %2, 100, !dbg !53
  br i1 %cmp3, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 %3, !dbg !57
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !57
  %5 = load i8*, i8** %data, align 8, !dbg !58
  %6 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !58
  store i8 %4, i8* %arrayidx5, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %7, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !67
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !67
  store i8 0, i8* %arrayidx6, align 1, !dbg !68
  %9 = load i8*, i8** %data, align 8, !dbg !69
  call void @printLine(i8* %9), !dbg !70
  %10 = load i8*, i8** %data, align 8, !dbg !71
  call void @free(i8* %10) #6, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_18_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_18_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_18_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i8* null, i8** %data, align 8, !dbg !99
  br label %source, !dbg !100

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !101), !dbg !102
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !103
  store i8* %call, i8** %data, align 8, !dbg !104
  %0 = load i8*, i8** %data, align 8, !dbg !105
  %cmp = icmp eq i8* %0, null, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !109
  unreachable, !dbg !109

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !118
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !119
  store i8 0, i8* %arrayidx2, align 1, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !124
  %cmp3 = icmp ult i64 %2, 100, !dbg !126
  br i1 %cmp3, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 %3, !dbg !130
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !130
  %5 = load i8*, i8** %data, align 8, !dbg !131
  %6 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !131
  store i8 %4, i8* %arrayidx5, align 1, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %7, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !139
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !139
  store i8 0, i8* %arrayidx6, align 1, !dbg !140
  %9 = load i8*, i8** %data, align 8, !dbg !141
  call void @printLine(i8* %9), !dbg !142
  %10 = load i8*, i8** %data, align 8, !dbg !143
  call void @free(i8* %10) #6, !dbg !144
  ret void, !dbg !145
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_18.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_18_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_18.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !15, line: 28)
!23 = !DILocation(line: 28, column: 1, scope: !14)
!24 = !DILocation(line: 30, column: 20, scope: !14)
!25 = !DILocation(line: 30, column: 10, scope: !14)
!26 = !DILocation(line: 31, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 9)
!28 = !DILocation(line: 31, column: 14, scope: !27)
!29 = !DILocation(line: 31, column: 9, scope: !14)
!30 = !DILocation(line: 31, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 31, column: 23)
!32 = !DILocation(line: 32, column: 5, scope: !14)
!33 = !DILocation(line: 32, column: 13, scope: !14)
!34 = !DILocalVariable(name: "i", scope: !35, file: !15, line: 34, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 34, column: 16, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 35, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 35, column: 14, scope: !35)
!45 = !DILocation(line: 36, column: 9, scope: !35)
!46 = !DILocation(line: 37, column: 9, scope: !35)
!47 = !DILocation(line: 37, column: 23, scope: !35)
!48 = !DILocation(line: 39, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !35, file: !15, line: 39, column: 9)
!50 = !DILocation(line: 39, column: 14, scope: !49)
!51 = !DILocation(line: 39, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !15, line: 39, column: 9)
!53 = !DILocation(line: 39, column: 23, scope: !52)
!54 = !DILocation(line: 39, column: 9, scope: !49)
!55 = !DILocation(line: 41, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !15, line: 40, column: 9)
!57 = !DILocation(line: 41, column: 23, scope: !56)
!58 = !DILocation(line: 41, column: 13, scope: !56)
!59 = !DILocation(line: 41, column: 18, scope: !56)
!60 = !DILocation(line: 41, column: 21, scope: !56)
!61 = !DILocation(line: 42, column: 9, scope: !56)
!62 = !DILocation(line: 39, column: 31, scope: !52)
!63 = !DILocation(line: 39, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 42, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 43, column: 9, scope: !35)
!68 = !DILocation(line: 43, column: 21, scope: !35)
!69 = !DILocation(line: 44, column: 19, scope: !35)
!70 = !DILocation(line: 44, column: 9, scope: !35)
!71 = !DILocation(line: 45, column: 14, scope: !35)
!72 = !DILocation(line: 45, column: 9, scope: !35)
!73 = !DILocation(line: 47, column: 1, scope: !14)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_18_good", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 82, column: 5, scope: !74)
!76 = !DILocation(line: 83, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 95, type: !78, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !15, line: 95, type: !80)
!83 = !DILocation(line: 95, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !15, line: 95, type: !81)
!85 = !DILocation(line: 95, column: 27, scope: !77)
!86 = !DILocation(line: 98, column: 22, scope: !77)
!87 = !DILocation(line: 98, column: 12, scope: !77)
!88 = !DILocation(line: 98, column: 5, scope: !77)
!89 = !DILocation(line: 100, column: 5, scope: !77)
!90 = !DILocation(line: 101, column: 5, scope: !77)
!91 = !DILocation(line: 102, column: 5, scope: !77)
!92 = !DILocation(line: 105, column: 5, scope: !77)
!93 = !DILocation(line: 106, column: 5, scope: !77)
!94 = !DILocation(line: 107, column: 5, scope: !77)
!95 = !DILocation(line: 109, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 56, type: !4)
!98 = !DILocation(line: 56, column: 12, scope: !96)
!99 = !DILocation(line: 57, column: 10, scope: !96)
!100 = !DILocation(line: 58, column: 5, scope: !96)
!101 = !DILabel(scope: !96, name: "source", file: !15, line: 59)
!102 = !DILocation(line: 59, column: 1, scope: !96)
!103 = !DILocation(line: 61, column: 20, scope: !96)
!104 = !DILocation(line: 61, column: 10, scope: !96)
!105 = !DILocation(line: 62, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !96, file: !15, line: 62, column: 9)
!107 = !DILocation(line: 62, column: 14, scope: !106)
!108 = !DILocation(line: 62, column: 9, scope: !96)
!109 = !DILocation(line: 62, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !15, line: 62, column: 23)
!111 = !DILocation(line: 63, column: 5, scope: !96)
!112 = !DILocation(line: 63, column: 13, scope: !96)
!113 = !DILocalVariable(name: "i", scope: !114, file: !15, line: 65, type: !36)
!114 = distinct !DILexicalBlock(scope: !96, file: !15, line: 64, column: 5)
!115 = !DILocation(line: 65, column: 16, scope: !114)
!116 = !DILocalVariable(name: "source", scope: !114, file: !15, line: 66, type: !41)
!117 = !DILocation(line: 66, column: 14, scope: !114)
!118 = !DILocation(line: 67, column: 9, scope: !114)
!119 = !DILocation(line: 68, column: 9, scope: !114)
!120 = !DILocation(line: 68, column: 23, scope: !114)
!121 = !DILocation(line: 70, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !114, file: !15, line: 70, column: 9)
!123 = !DILocation(line: 70, column: 14, scope: !122)
!124 = !DILocation(line: 70, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !15, line: 70, column: 9)
!126 = !DILocation(line: 70, column: 23, scope: !125)
!127 = !DILocation(line: 70, column: 9, scope: !122)
!128 = !DILocation(line: 72, column: 30, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 71, column: 9)
!130 = !DILocation(line: 72, column: 23, scope: !129)
!131 = !DILocation(line: 72, column: 13, scope: !129)
!132 = !DILocation(line: 72, column: 18, scope: !129)
!133 = !DILocation(line: 72, column: 21, scope: !129)
!134 = !DILocation(line: 73, column: 9, scope: !129)
!135 = !DILocation(line: 70, column: 31, scope: !125)
!136 = !DILocation(line: 70, column: 9, scope: !125)
!137 = distinct !{!137, !127, !138, !66}
!138 = !DILocation(line: 73, column: 9, scope: !122)
!139 = !DILocation(line: 74, column: 9, scope: !114)
!140 = !DILocation(line: 74, column: 21, scope: !114)
!141 = !DILocation(line: 75, column: 19, scope: !114)
!142 = !DILocation(line: 75, column: 9, scope: !114)
!143 = !DILocation(line: 76, column: 14, scope: !114)
!144 = !DILocation(line: 76, column: 9, scope: !114)
!145 = !DILocation(line: 78, column: 1, scope: !96)
