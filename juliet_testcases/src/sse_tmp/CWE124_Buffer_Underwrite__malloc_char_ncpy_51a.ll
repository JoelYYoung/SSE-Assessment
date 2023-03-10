; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_51a.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_51a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_51_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !23
  store i8* %call, i8** %dataBuffer, align 8, !dbg !22
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 -8, !dbg !29
  store i8* %add.ptr, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_51b_badSink(i8* %3), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_51b_badSink(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_51_good() #0 !dbg !34 {
entry:
  call void @goodG2B(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !37 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call i64 @time(i64* null) #5, !dbg !46
  %conv = trunc i64 %call to i32, !dbg !47
  call void @srand(i32 %conv) #5, !dbg !48
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !49
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_51_good(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !52
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_51_bad(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !56 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !57, metadata !DIExpression()), !dbg !58
  store i8* null, i8** %data, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !62
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !63
  store i8* %call, i8** %dataBuffer, align 8, !dbg !62
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !65
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !66
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !66
  store i8 0, i8* %arrayidx, align 1, !dbg !67
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !68
  store i8* %2, i8** %data, align 8, !dbg !69
  %3 = load i8*, i8** %data, align 8, !dbg !70
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_51b_goodG2BSink(i8* %3), !dbg !71
  ret void, !dbg !72
}

declare dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_51b_goodG2BSink(i8*) #4

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_51a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_51_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_51a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocation(line: 29, column: 10, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 31, type: !4)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!22 = !DILocation(line: 31, column: 16, scope: !21)
!23 = !DILocation(line: 31, column: 37, scope: !21)
!24 = !DILocation(line: 32, column: 16, scope: !21)
!25 = !DILocation(line: 32, column: 9, scope: !21)
!26 = !DILocation(line: 33, column: 9, scope: !21)
!27 = !DILocation(line: 33, column: 27, scope: !21)
!28 = !DILocation(line: 35, column: 16, scope: !21)
!29 = !DILocation(line: 35, column: 27, scope: !21)
!30 = !DILocation(line: 35, column: 14, scope: !21)
!31 = !DILocation(line: 37, column: 60, scope: !13)
!32 = !DILocation(line: 37, column: 5, scope: !13)
!33 = !DILocation(line: 38, column: 1, scope: !13)
!34 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_51_good", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 64, column: 5, scope: !34)
!36 = !DILocation(line: 65, column: 1, scope: !34)
!37 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 77, type: !38, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!40, !40, !41}
!40 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !37, file: !14, line: 77, type: !40)
!43 = !DILocation(line: 77, column: 14, scope: !37)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !37, file: !14, line: 77, type: !41)
!45 = !DILocation(line: 77, column: 27, scope: !37)
!46 = !DILocation(line: 80, column: 22, scope: !37)
!47 = !DILocation(line: 80, column: 12, scope: !37)
!48 = !DILocation(line: 80, column: 5, scope: !37)
!49 = !DILocation(line: 82, column: 5, scope: !37)
!50 = !DILocation(line: 83, column: 5, scope: !37)
!51 = !DILocation(line: 84, column: 5, scope: !37)
!52 = !DILocation(line: 87, column: 5, scope: !37)
!53 = !DILocation(line: 88, column: 5, scope: !37)
!54 = !DILocation(line: 89, column: 5, scope: !37)
!55 = !DILocation(line: 91, column: 5, scope: !37)
!56 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", scope: !56, file: !14, line: 50, type: !4)
!58 = !DILocation(line: 50, column: 12, scope: !56)
!59 = !DILocation(line: 51, column: 10, scope: !56)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !14, line: 53, type: !4)
!61 = distinct !DILexicalBlock(scope: !56, file: !14, line: 52, column: 5)
!62 = !DILocation(line: 53, column: 16, scope: !61)
!63 = !DILocation(line: 53, column: 37, scope: !61)
!64 = !DILocation(line: 54, column: 16, scope: !61)
!65 = !DILocation(line: 54, column: 9, scope: !61)
!66 = !DILocation(line: 55, column: 9, scope: !61)
!67 = !DILocation(line: 55, column: 27, scope: !61)
!68 = !DILocation(line: 57, column: 16, scope: !61)
!69 = !DILocation(line: 57, column: 14, scope: !61)
!70 = !DILocation(line: 59, column: 64, scope: !56)
!71 = !DILocation(line: 59, column: 5, scope: !56)
!72 = !DILocation(line: 60, column: 1, scope: !56)
