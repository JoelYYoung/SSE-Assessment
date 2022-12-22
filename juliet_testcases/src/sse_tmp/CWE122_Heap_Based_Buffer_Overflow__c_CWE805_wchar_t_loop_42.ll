; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !36
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !37
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %1, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !49
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  %5 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !50
  store i32 %3, i32* %arrayidx3, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %6, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !59
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !59
  store i32 0, i32* %arrayidx4, align 4, !dbg !60
  %8 = load i32*, i32** %data, align 8, !dbg !61
  call void @printWLine(i32* %8), !dbg !62
  %9 = load i32*, i32** %data, align 8, !dbg !63
  %10 = bitcast i32* %9 to i8*, !dbg !63
  call void @free(i8* %10) #5, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !66 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !71
  %0 = bitcast i8* %call to i32*, !dbg !72
  store i32* %0, i32** %data.addr, align 8, !dbg !73
  %1 = load i32*, i32** %data.addr, align 8, !dbg !74
  %cmp = icmp eq i32* %1, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  %3 = load i32*, i32** %data.addr, align 8, !dbg !82
  ret i32* %3, !dbg !83
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_42_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #5, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #5, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_42_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_42_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i32* null, i32** %data, align 8, !dbg !110
  %0 = load i32*, i32** %data, align 8, !dbg !111
  %call = call i32* @goodG2BSource(i32* %0), !dbg !112
  store i32* %call, i32** %data, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !119
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !120
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !126
  %cmp = icmp ult i64 %1, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !132
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !132
  %4 = load i32*, i32** %data, align 8, !dbg !133
  %5 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !133
  store i32 %3, i32* %arrayidx3, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %6, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !141
  store i32 0, i32* %arrayidx4, align 4, !dbg !142
  %8 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %8), !dbg !144
  %9 = load i32*, i32** %data, align 8, !dbg !145
  %10 = bitcast i32* %9 to i8*, !dbg !145
  call void @free(i8* %10) #5, !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !148 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !149, metadata !DIExpression()), !dbg !150
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !151
  %0 = bitcast i8* %call to i32*, !dbg !152
  store i32* %0, i32** %data.addr, align 8, !dbg !153
  %1 = load i32*, i32** %data.addr, align 8, !dbg !154
  %cmp = icmp eq i32* %1, null, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !158
  unreachable, !dbg !158

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !160
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !160
  store i32 0, i32* %arrayidx, align 4, !dbg !161
  %3 = load i32*, i32** %data.addr, align 8, !dbg !162
  ret i32* %3, !dbg !163
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_42_bad", scope: !17, file: !17, line: 32, type: !18, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_42.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 34, type: !5)
!21 = !DILocation(line: 34, column: 15, scope: !16)
!22 = !DILocation(line: 35, column: 10, scope: !16)
!23 = !DILocation(line: 36, column: 22, scope: !16)
!24 = !DILocation(line: 36, column: 12, scope: !16)
!25 = !DILocation(line: 36, column: 10, scope: !16)
!26 = !DILocalVariable(name: "i", scope: !27, file: !17, line: 38, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !29)
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 38, column: 16, scope: !27)
!31 = !DILocalVariable(name: "source", scope: !27, file: !17, line: 39, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 39, column: 17, scope: !27)
!36 = !DILocation(line: 40, column: 17, scope: !27)
!37 = !DILocation(line: 40, column: 9, scope: !27)
!38 = !DILocation(line: 41, column: 9, scope: !27)
!39 = !DILocation(line: 41, column: 23, scope: !27)
!40 = !DILocation(line: 43, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !27, file: !17, line: 43, column: 9)
!42 = !DILocation(line: 43, column: 14, scope: !41)
!43 = !DILocation(line: 43, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !17, line: 43, column: 9)
!45 = !DILocation(line: 43, column: 23, scope: !44)
!46 = !DILocation(line: 43, column: 9, scope: !41)
!47 = !DILocation(line: 45, column: 30, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !17, line: 44, column: 9)
!49 = !DILocation(line: 45, column: 23, scope: !48)
!50 = !DILocation(line: 45, column: 13, scope: !48)
!51 = !DILocation(line: 45, column: 18, scope: !48)
!52 = !DILocation(line: 45, column: 21, scope: !48)
!53 = !DILocation(line: 46, column: 9, scope: !48)
!54 = !DILocation(line: 43, column: 31, scope: !44)
!55 = !DILocation(line: 43, column: 9, scope: !44)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 46, column: 9, scope: !41)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 47, column: 9, scope: !27)
!60 = !DILocation(line: 47, column: 21, scope: !27)
!61 = !DILocation(line: 48, column: 20, scope: !27)
!62 = !DILocation(line: 48, column: 9, scope: !27)
!63 = !DILocation(line: 49, column: 14, scope: !27)
!64 = !DILocation(line: 49, column: 9, scope: !27)
!65 = !DILocation(line: 51, column: 1, scope: !16)
!66 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !67, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!5, !5}
!69 = !DILocalVariable(name: "data", arg: 1, scope: !66, file: !17, line: 23, type: !5)
!70 = !DILocation(line: 23, column: 38, scope: !66)
!71 = !DILocation(line: 26, column: 23, scope: !66)
!72 = !DILocation(line: 26, column: 12, scope: !66)
!73 = !DILocation(line: 26, column: 10, scope: !66)
!74 = !DILocation(line: 27, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !66, file: !17, line: 27, column: 9)
!76 = !DILocation(line: 27, column: 14, scope: !75)
!77 = !DILocation(line: 27, column: 9, scope: !66)
!78 = !DILocation(line: 27, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !17, line: 27, column: 23)
!80 = !DILocation(line: 28, column: 5, scope: !66)
!81 = !DILocation(line: 28, column: 13, scope: !66)
!82 = !DILocation(line: 29, column: 12, scope: !66)
!83 = !DILocation(line: 29, column: 5, scope: !66)
!84 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_42_good", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 90, column: 5, scope: !84)
!86 = !DILocation(line: 91, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 103, type: !88, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!8, !8, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !17, line: 103, type: !8)
!94 = !DILocation(line: 103, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !17, line: 103, type: !90)
!96 = !DILocation(line: 103, column: 27, scope: !87)
!97 = !DILocation(line: 106, column: 22, scope: !87)
!98 = !DILocation(line: 106, column: 12, scope: !87)
!99 = !DILocation(line: 106, column: 5, scope: !87)
!100 = !DILocation(line: 108, column: 5, scope: !87)
!101 = !DILocation(line: 109, column: 5, scope: !87)
!102 = !DILocation(line: 110, column: 5, scope: !87)
!103 = !DILocation(line: 113, column: 5, scope: !87)
!104 = !DILocation(line: 114, column: 5, scope: !87)
!105 = !DILocation(line: 115, column: 5, scope: !87)
!106 = !DILocation(line: 117, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 67, type: !18, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !17, line: 69, type: !5)
!109 = !DILocation(line: 69, column: 15, scope: !107)
!110 = !DILocation(line: 70, column: 10, scope: !107)
!111 = !DILocation(line: 71, column: 26, scope: !107)
!112 = !DILocation(line: 71, column: 12, scope: !107)
!113 = !DILocation(line: 71, column: 10, scope: !107)
!114 = !DILocalVariable(name: "i", scope: !115, file: !17, line: 73, type: !28)
!115 = distinct !DILexicalBlock(scope: !107, file: !17, line: 72, column: 5)
!116 = !DILocation(line: 73, column: 16, scope: !115)
!117 = !DILocalVariable(name: "source", scope: !115, file: !17, line: 74, type: !32)
!118 = !DILocation(line: 74, column: 17, scope: !115)
!119 = !DILocation(line: 75, column: 17, scope: !115)
!120 = !DILocation(line: 75, column: 9, scope: !115)
!121 = !DILocation(line: 76, column: 9, scope: !115)
!122 = !DILocation(line: 76, column: 23, scope: !115)
!123 = !DILocation(line: 78, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !115, file: !17, line: 78, column: 9)
!125 = !DILocation(line: 78, column: 14, scope: !124)
!126 = !DILocation(line: 78, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !17, line: 78, column: 9)
!128 = !DILocation(line: 78, column: 23, scope: !127)
!129 = !DILocation(line: 78, column: 9, scope: !124)
!130 = !DILocation(line: 80, column: 30, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !17, line: 79, column: 9)
!132 = !DILocation(line: 80, column: 23, scope: !131)
!133 = !DILocation(line: 80, column: 13, scope: !131)
!134 = !DILocation(line: 80, column: 18, scope: !131)
!135 = !DILocation(line: 80, column: 21, scope: !131)
!136 = !DILocation(line: 81, column: 9, scope: !131)
!137 = !DILocation(line: 78, column: 31, scope: !127)
!138 = !DILocation(line: 78, column: 9, scope: !127)
!139 = distinct !{!139, !129, !140, !58}
!140 = !DILocation(line: 81, column: 9, scope: !124)
!141 = !DILocation(line: 82, column: 9, scope: !115)
!142 = !DILocation(line: 82, column: 21, scope: !115)
!143 = !DILocation(line: 83, column: 20, scope: !115)
!144 = !DILocation(line: 83, column: 9, scope: !115)
!145 = !DILocation(line: 84, column: 14, scope: !115)
!146 = !DILocation(line: 84, column: 9, scope: !115)
!147 = !DILocation(line: 86, column: 1, scope: !107)
!148 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 57, type: !67, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", arg: 1, scope: !148, file: !17, line: 57, type: !5)
!150 = !DILocation(line: 57, column: 42, scope: !148)
!151 = !DILocation(line: 60, column: 23, scope: !148)
!152 = !DILocation(line: 60, column: 12, scope: !148)
!153 = !DILocation(line: 60, column: 10, scope: !148)
!154 = !DILocation(line: 61, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !148, file: !17, line: 61, column: 9)
!156 = !DILocation(line: 61, column: 14, scope: !155)
!157 = !DILocation(line: 61, column: 9, scope: !148)
!158 = !DILocation(line: 61, column: 24, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !17, line: 61, column: 23)
!160 = !DILocation(line: 62, column: 5, scope: !148)
!161 = !DILocation(line: 62, column: 13, scope: !148)
!162 = !DILocation(line: 63, column: 12, scope: !148)
!163 = !DILocation(line: 63, column: 5, scope: !148)
