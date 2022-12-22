; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx2, align 1, !dbg !42
  %2 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !44
  %call4 = call i8* @strcpy(i8* %2, i8* %arraydecay3) #6, !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %3), !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* %4) #6, !dbg !49
  ret void, !dbg !50
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

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_18_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_18_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_18_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i8* null, i8** %data, align 8, !dbg !76
  br label %source, !dbg !77

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !78), !dbg !79
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !80
  store i8* %call, i8** %data, align 8, !dbg !81
  %0 = load i8*, i8** %data, align 8, !dbg !82
  %cmp = icmp eq i8* %0, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !93
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx2, align 1, !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !97
  %call4 = call i8* @strcpy(i8* %2, i8* %arraydecay3) #6, !dbg !98
  %3 = load i8*, i8** %data, align 8, !dbg !99
  call void @printLine(i8* %3), !dbg !100
  %4 = load i8*, i8** %data, align 8, !dbg !101
  call void @free(i8* %4) #6, !dbg !102
  ret void, !dbg !103
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_18.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_18_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_18.c", directory: "/root/SSE-Assessment")
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
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 34, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 34, column: 14, scope: !35)
!40 = !DILocation(line: 35, column: 9, scope: !35)
!41 = !DILocation(line: 36, column: 9, scope: !35)
!42 = !DILocation(line: 36, column: 23, scope: !35)
!43 = !DILocation(line: 38, column: 16, scope: !35)
!44 = !DILocation(line: 38, column: 22, scope: !35)
!45 = !DILocation(line: 38, column: 9, scope: !35)
!46 = !DILocation(line: 39, column: 19, scope: !35)
!47 = !DILocation(line: 39, column: 9, scope: !35)
!48 = !DILocation(line: 40, column: 14, scope: !35)
!49 = !DILocation(line: 40, column: 9, scope: !35)
!50 = !DILocation(line: 42, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_18_good", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 72, column: 5, scope: !51)
!53 = !DILocation(line: 73, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 85, type: !55, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !15, line: 85, type: !57)
!60 = !DILocation(line: 85, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !15, line: 85, type: !58)
!62 = !DILocation(line: 85, column: 27, scope: !54)
!63 = !DILocation(line: 88, column: 22, scope: !54)
!64 = !DILocation(line: 88, column: 12, scope: !54)
!65 = !DILocation(line: 88, column: 5, scope: !54)
!66 = !DILocation(line: 90, column: 5, scope: !54)
!67 = !DILocation(line: 91, column: 5, scope: !54)
!68 = !DILocation(line: 92, column: 5, scope: !54)
!69 = !DILocation(line: 95, column: 5, scope: !54)
!70 = !DILocation(line: 96, column: 5, scope: !54)
!71 = !DILocation(line: 97, column: 5, scope: !54)
!72 = !DILocation(line: 99, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 51, type: !4)
!75 = !DILocation(line: 51, column: 12, scope: !73)
!76 = !DILocation(line: 52, column: 10, scope: !73)
!77 = !DILocation(line: 53, column: 5, scope: !73)
!78 = !DILabel(scope: !73, name: "source", file: !15, line: 54)
!79 = !DILocation(line: 54, column: 1, scope: !73)
!80 = !DILocation(line: 56, column: 20, scope: !73)
!81 = !DILocation(line: 56, column: 10, scope: !73)
!82 = !DILocation(line: 57, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !15, line: 57, column: 9)
!84 = !DILocation(line: 57, column: 14, scope: !83)
!85 = !DILocation(line: 57, column: 9, scope: !73)
!86 = !DILocation(line: 57, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 57, column: 23)
!88 = !DILocation(line: 58, column: 5, scope: !73)
!89 = !DILocation(line: 58, column: 13, scope: !73)
!90 = !DILocalVariable(name: "source", scope: !91, file: !15, line: 60, type: !36)
!91 = distinct !DILexicalBlock(scope: !73, file: !15, line: 59, column: 5)
!92 = !DILocation(line: 60, column: 14, scope: !91)
!93 = !DILocation(line: 61, column: 9, scope: !91)
!94 = !DILocation(line: 62, column: 9, scope: !91)
!95 = !DILocation(line: 62, column: 23, scope: !91)
!96 = !DILocation(line: 64, column: 16, scope: !91)
!97 = !DILocation(line: 64, column: 22, scope: !91)
!98 = !DILocation(line: 64, column: 9, scope: !91)
!99 = !DILocation(line: 65, column: 19, scope: !91)
!100 = !DILocation(line: 65, column: 9, scope: !91)
!101 = !DILocation(line: 66, column: 14, scope: !91)
!102 = !DILocation(line: 66, column: 9, scope: !91)
!103 = !DILocation(line: 68, column: 1, scope: !73)
