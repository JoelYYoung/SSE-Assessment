; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_11.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memmove_11_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %call1 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !28
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !27
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then2, label %if.end, !dbg !32

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !40
  store i8* %add.ptr, i8** %data, align 8, !dbg !41
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx4, align 1, !dbg !51
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %4 = load i8*, i8** %data, align 8, !dbg !53
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %4, i64 100, i1 false), !dbg !52
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx6, align 1, !dbg !55
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay7), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memmove_11_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__malloc_char_memmove_11_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__malloc_char_memmove_11_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* null, i8** %data, align 8, !dbg !85
  %call = call i32 (...) @globalReturnsFalse(), !dbg !86
  %tobool = icmp ne i32 %call, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end3, !dbg !91

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !95
  %call1 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !96
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !95
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !97
  %cmp = icmp eq i8* %0, null, !dbg !99
  br i1 %cmp, label %if.then2, label %if.end, !dbg !100

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !104
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  store i8* %3, i8** %data, align 8, !dbg !108
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx4, align 1, !dbg !114
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  %4 = load i8*, i8** %data, align 8, !dbg !116
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %4, i64 100, i1 false), !dbg !115
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx6, align 1, !dbg !118
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  call void @printLine(i8* %arraydecay7), !dbg !120
  ret void, !dbg !121
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !122 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !123, metadata !DIExpression()), !dbg !124
  store i8* null, i8** %data, align 8, !dbg !125
  %call = call i32 (...) @globalReturnsTrue(), !dbg !126
  %tobool = icmp ne i32 %call, 0, !dbg !126
  br i1 %tobool, label %if.then, label %if.end3, !dbg !128

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !129, metadata !DIExpression()), !dbg !132
  %call1 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !133
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !132
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !134
  %cmp = icmp eq i8* %0, null, !dbg !136
  br i1 %cmp, label %if.then2, label %if.end, !dbg !137

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !138
  unreachable, !dbg !138

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !141
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !142
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !142
  store i8 0, i8* %arrayidx, align 1, !dbg !143
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !144
  store i8* %3, i8** %data, align 8, !dbg !145
  br label %if.end3, !dbg !146

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !147, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !150
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !151
  store i8 0, i8* %arrayidx4, align 1, !dbg !152
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !153
  %4 = load i8*, i8** %data, align 8, !dbg !154
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %4, i64 100, i1 false), !dbg !153
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !155
  store i8 0, i8* %arrayidx6, align 1, !dbg !156
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  call void @printLine(i8* %arraydecay7), !dbg !158
  ret void, !dbg !159
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memmove_11_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_11.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 20, scope: !25)
!28 = !DILocation(line: 30, column: 41, scope: !25)
!29 = !DILocation(line: 31, column: 17, scope: !30)
!30 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 17)
!31 = !DILocation(line: 31, column: 28, scope: !30)
!32 = !DILocation(line: 31, column: 17, scope: !25)
!33 = !DILocation(line: 31, column: 38, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 31, column: 37)
!35 = !DILocation(line: 32, column: 20, scope: !25)
!36 = !DILocation(line: 32, column: 13, scope: !25)
!37 = !DILocation(line: 33, column: 13, scope: !25)
!38 = !DILocation(line: 33, column: 31, scope: !25)
!39 = !DILocation(line: 35, column: 20, scope: !25)
!40 = !DILocation(line: 35, column: 31, scope: !25)
!41 = !DILocation(line: 35, column: 18, scope: !25)
!42 = !DILocation(line: 37, column: 5, scope: !26)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !15, line: 39, type: !45)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 39, column: 14, scope: !44)
!49 = !DILocation(line: 40, column: 9, scope: !44)
!50 = !DILocation(line: 41, column: 9, scope: !44)
!51 = !DILocation(line: 41, column: 21, scope: !44)
!52 = !DILocation(line: 43, column: 9, scope: !44)
!53 = !DILocation(line: 43, column: 23, scope: !44)
!54 = !DILocation(line: 45, column: 9, scope: !44)
!55 = !DILocation(line: 45, column: 21, scope: !44)
!56 = !DILocation(line: 46, column: 19, scope: !44)
!57 = !DILocation(line: 46, column: 9, scope: !44)
!58 = !DILocation(line: 50, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memmove_11_good", scope: !15, file: !15, line: 121, type: !16, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 123, column: 5, scope: !59)
!61 = !DILocation(line: 124, column: 5, scope: !59)
!62 = !DILocation(line: 125, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 137, type: !64, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 137, type: !66)
!69 = !DILocation(line: 137, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 137, type: !67)
!71 = !DILocation(line: 137, column: 27, scope: !63)
!72 = !DILocation(line: 140, column: 22, scope: !63)
!73 = !DILocation(line: 140, column: 12, scope: !63)
!74 = !DILocation(line: 140, column: 5, scope: !63)
!75 = !DILocation(line: 142, column: 5, scope: !63)
!76 = !DILocation(line: 143, column: 5, scope: !63)
!77 = !DILocation(line: 144, column: 5, scope: !63)
!78 = !DILocation(line: 147, column: 5, scope: !63)
!79 = !DILocation(line: 148, column: 5, scope: !63)
!80 = !DILocation(line: 149, column: 5, scope: !63)
!81 = !DILocation(line: 151, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 59, type: !4)
!84 = !DILocation(line: 59, column: 12, scope: !82)
!85 = !DILocation(line: 60, column: 10, scope: !82)
!86 = !DILocation(line: 61, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !15, line: 61, column: 8)
!88 = !DILocation(line: 61, column: 8, scope: !82)
!89 = !DILocation(line: 64, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !15, line: 62, column: 5)
!91 = !DILocation(line: 65, column: 5, scope: !90)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !15, line: 69, type: !4)
!93 = distinct !DILexicalBlock(scope: !94, file: !15, line: 68, column: 9)
!94 = distinct !DILexicalBlock(scope: !87, file: !15, line: 67, column: 5)
!95 = !DILocation(line: 69, column: 20, scope: !93)
!96 = !DILocation(line: 69, column: 41, scope: !93)
!97 = !DILocation(line: 70, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !15, line: 70, column: 17)
!99 = !DILocation(line: 70, column: 28, scope: !98)
!100 = !DILocation(line: 70, column: 17, scope: !93)
!101 = !DILocation(line: 70, column: 38, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 70, column: 37)
!103 = !DILocation(line: 71, column: 20, scope: !93)
!104 = !DILocation(line: 71, column: 13, scope: !93)
!105 = !DILocation(line: 72, column: 13, scope: !93)
!106 = !DILocation(line: 72, column: 31, scope: !93)
!107 = !DILocation(line: 74, column: 20, scope: !93)
!108 = !DILocation(line: 74, column: 18, scope: !93)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !15, line: 78, type: !45)
!110 = distinct !DILexicalBlock(scope: !82, file: !15, line: 77, column: 5)
!111 = !DILocation(line: 78, column: 14, scope: !110)
!112 = !DILocation(line: 79, column: 9, scope: !110)
!113 = !DILocation(line: 80, column: 9, scope: !110)
!114 = !DILocation(line: 80, column: 21, scope: !110)
!115 = !DILocation(line: 82, column: 9, scope: !110)
!116 = !DILocation(line: 82, column: 23, scope: !110)
!117 = !DILocation(line: 84, column: 9, scope: !110)
!118 = !DILocation(line: 84, column: 21, scope: !110)
!119 = !DILocation(line: 85, column: 19, scope: !110)
!120 = !DILocation(line: 85, column: 9, scope: !110)
!121 = !DILocation(line: 89, column: 1, scope: !82)
!122 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", scope: !122, file: !15, line: 94, type: !4)
!124 = !DILocation(line: 94, column: 12, scope: !122)
!125 = !DILocation(line: 95, column: 10, scope: !122)
!126 = !DILocation(line: 96, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !15, line: 96, column: 8)
!128 = !DILocation(line: 96, column: 8, scope: !122)
!129 = !DILocalVariable(name: "dataBuffer", scope: !130, file: !15, line: 99, type: !4)
!130 = distinct !DILexicalBlock(scope: !131, file: !15, line: 98, column: 9)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 97, column: 5)
!132 = !DILocation(line: 99, column: 20, scope: !130)
!133 = !DILocation(line: 99, column: 41, scope: !130)
!134 = !DILocation(line: 100, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !15, line: 100, column: 17)
!136 = !DILocation(line: 100, column: 28, scope: !135)
!137 = !DILocation(line: 100, column: 17, scope: !130)
!138 = !DILocation(line: 100, column: 38, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !15, line: 100, column: 37)
!140 = !DILocation(line: 101, column: 20, scope: !130)
!141 = !DILocation(line: 101, column: 13, scope: !130)
!142 = !DILocation(line: 102, column: 13, scope: !130)
!143 = !DILocation(line: 102, column: 31, scope: !130)
!144 = !DILocation(line: 104, column: 20, scope: !130)
!145 = !DILocation(line: 104, column: 18, scope: !130)
!146 = !DILocation(line: 106, column: 5, scope: !131)
!147 = !DILocalVariable(name: "dest", scope: !148, file: !15, line: 108, type: !45)
!148 = distinct !DILexicalBlock(scope: !122, file: !15, line: 107, column: 5)
!149 = !DILocation(line: 108, column: 14, scope: !148)
!150 = !DILocation(line: 109, column: 9, scope: !148)
!151 = !DILocation(line: 110, column: 9, scope: !148)
!152 = !DILocation(line: 110, column: 21, scope: !148)
!153 = !DILocation(line: 112, column: 9, scope: !148)
!154 = !DILocation(line: 112, column: 23, scope: !148)
!155 = !DILocation(line: 114, column: 9, scope: !148)
!156 = !DILocation(line: 114, column: 21, scope: !148)
!157 = !DILocation(line: 115, column: 19, scope: !148)
!158 = !DILocation(line: 115, column: 9, scope: !148)
!159 = !DILocation(line: 119, column: 1, scope: !122)
