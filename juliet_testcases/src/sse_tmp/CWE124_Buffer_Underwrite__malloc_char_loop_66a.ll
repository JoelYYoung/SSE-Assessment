; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_66a.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_66_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataArray = alloca [5 x i8*], align 16
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [5 x i8*]* %dataArray, metadata !19, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !28
  store i8* %call, i8** %dataBuffer, align 8, !dbg !27
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !30
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 -8, !dbg !34
  store i8* %add.ptr, i8** %data, align 8, !dbg !35
  %3 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 2, !dbg !37
  store i8* %3, i8** %arrayidx1, align 16, !dbg !38
  %arraydecay = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 0, !dbg !39
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_66b_badSink(i8** %arraydecay), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_66b_badSink(i8**) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_66_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #5, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #5, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_66_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_66_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %dataArray = alloca [5 x i8*], align 16
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [5 x i8*]* %dataArray, metadata !67, metadata !DIExpression()), !dbg !68
  store i8* null, i8** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !72
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !73
  store i8* %call, i8** %dataBuffer, align 8, !dbg !72
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !75
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !78
  store i8* %2, i8** %data, align 8, !dbg !79
  %3 = load i8*, i8** %data, align 8, !dbg !80
  %arrayidx1 = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 2, !dbg !81
  store i8* %3, i8** %arrayidx1, align 16, !dbg !82
  %arraydecay = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 0, !dbg !83
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_66b_goodG2BSink(i8** %arraydecay), !dbg !84
  ret void, !dbg !85
}

declare dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_66b_goodG2BSink(i8**) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_66a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_66_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_66a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataArray", scope: !13, file: !14, line: 29, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 5)
!23 = !DILocation(line: 29, column: 12, scope: !13)
!24 = !DILocation(line: 30, column: 10, scope: !13)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !14, line: 32, type: !4)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!27 = !DILocation(line: 32, column: 16, scope: !26)
!28 = !DILocation(line: 32, column: 37, scope: !26)
!29 = !DILocation(line: 33, column: 16, scope: !26)
!30 = !DILocation(line: 33, column: 9, scope: !26)
!31 = !DILocation(line: 34, column: 9, scope: !26)
!32 = !DILocation(line: 34, column: 27, scope: !26)
!33 = !DILocation(line: 36, column: 16, scope: !26)
!34 = !DILocation(line: 36, column: 27, scope: !26)
!35 = !DILocation(line: 36, column: 14, scope: !26)
!36 = !DILocation(line: 39, column: 20, scope: !13)
!37 = !DILocation(line: 39, column: 5, scope: !13)
!38 = !DILocation(line: 39, column: 18, scope: !13)
!39 = !DILocation(line: 40, column: 60, scope: !13)
!40 = !DILocation(line: 40, column: 5, scope: !13)
!41 = !DILocation(line: 41, column: 1, scope: !13)
!42 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_66_good", scope: !14, file: !14, line: 66, type: !15, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 68, column: 5, scope: !42)
!44 = !DILocation(line: 69, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 81, type: !46, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !14, line: 81, type: !48)
!51 = !DILocation(line: 81, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !14, line: 81, type: !49)
!53 = !DILocation(line: 81, column: 27, scope: !45)
!54 = !DILocation(line: 84, column: 22, scope: !45)
!55 = !DILocation(line: 84, column: 12, scope: !45)
!56 = !DILocation(line: 84, column: 5, scope: !45)
!57 = !DILocation(line: 86, column: 5, scope: !45)
!58 = !DILocation(line: 87, column: 5, scope: !45)
!59 = !DILocation(line: 88, column: 5, scope: !45)
!60 = !DILocation(line: 91, column: 5, scope: !45)
!61 = !DILocation(line: 92, column: 5, scope: !45)
!62 = !DILocation(line: 93, column: 5, scope: !45)
!63 = !DILocation(line: 95, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !14, line: 52, type: !4)
!66 = !DILocation(line: 52, column: 12, scope: !64)
!67 = !DILocalVariable(name: "dataArray", scope: !64, file: !14, line: 53, type: !20)
!68 = !DILocation(line: 53, column: 12, scope: !64)
!69 = !DILocation(line: 54, column: 10, scope: !64)
!70 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !14, line: 56, type: !4)
!71 = distinct !DILexicalBlock(scope: !64, file: !14, line: 55, column: 5)
!72 = !DILocation(line: 56, column: 16, scope: !71)
!73 = !DILocation(line: 56, column: 37, scope: !71)
!74 = !DILocation(line: 57, column: 16, scope: !71)
!75 = !DILocation(line: 57, column: 9, scope: !71)
!76 = !DILocation(line: 58, column: 9, scope: !71)
!77 = !DILocation(line: 58, column: 27, scope: !71)
!78 = !DILocation(line: 60, column: 16, scope: !71)
!79 = !DILocation(line: 60, column: 14, scope: !71)
!80 = !DILocation(line: 62, column: 20, scope: !64)
!81 = !DILocation(line: 62, column: 5, scope: !64)
!82 = !DILocation(line: 62, column: 18, scope: !64)
!83 = !DILocation(line: 63, column: 64, scope: !64)
!84 = !DILocation(line: 63, column: 5, scope: !64)
!85 = !DILocation(line: 64, column: 1, scope: !64)
