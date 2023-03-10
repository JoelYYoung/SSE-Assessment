; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_63a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_63_bad() #0 !dbg !13 {
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
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_63b_badSink(i8** %data), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_63b_badSink(i8**) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_63_good() #0 !dbg !33 {
entry:
  call void @goodG2B(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %call = call i64 @time(i64* null) #5, !dbg !45
  %conv = trunc i64 %call to i32, !dbg !46
  call void @srand(i32 %conv) #5, !dbg !47
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_63_good(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_63_bad(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !55 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !56, metadata !DIExpression()), !dbg !57
  store i8* null, i8** %data, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !59, metadata !DIExpression()), !dbg !61
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !62
  store i8* %call, i8** %dataBuffer, align 8, !dbg !61
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !64
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !65
  store i8 0, i8* %arrayidx, align 1, !dbg !66
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !67
  store i8* %2, i8** %data, align 8, !dbg !68
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_63b_goodG2BSink(i8** %data), !dbg !69
  ret void, !dbg !70
}

declare dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_63b_goodG2BSink(i8**) #4

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_63a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_63_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_63a.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 37, column: 5, scope: !13)
!32 = !DILocation(line: 38, column: 1, scope: !13)
!33 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_63_good", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocation(line: 63, column: 5, scope: !33)
!35 = !DILocation(line: 64, column: 1, scope: !33)
!36 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 76, type: !37, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!39, !39, !40}
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !14, line: 76, type: !39)
!42 = !DILocation(line: 76, column: 14, scope: !36)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !14, line: 76, type: !40)
!44 = !DILocation(line: 76, column: 27, scope: !36)
!45 = !DILocation(line: 79, column: 22, scope: !36)
!46 = !DILocation(line: 79, column: 12, scope: !36)
!47 = !DILocation(line: 79, column: 5, scope: !36)
!48 = !DILocation(line: 81, column: 5, scope: !36)
!49 = !DILocation(line: 82, column: 5, scope: !36)
!50 = !DILocation(line: 83, column: 5, scope: !36)
!51 = !DILocation(line: 86, column: 5, scope: !36)
!52 = !DILocation(line: 87, column: 5, scope: !36)
!53 = !DILocation(line: 88, column: 5, scope: !36)
!54 = !DILocation(line: 90, column: 5, scope: !36)
!55 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "data", scope: !55, file: !14, line: 49, type: !4)
!57 = !DILocation(line: 49, column: 12, scope: !55)
!58 = !DILocation(line: 50, column: 10, scope: !55)
!59 = !DILocalVariable(name: "dataBuffer", scope: !60, file: !14, line: 52, type: !4)
!60 = distinct !DILexicalBlock(scope: !55, file: !14, line: 51, column: 5)
!61 = !DILocation(line: 52, column: 16, scope: !60)
!62 = !DILocation(line: 52, column: 37, scope: !60)
!63 = !DILocation(line: 53, column: 16, scope: !60)
!64 = !DILocation(line: 53, column: 9, scope: !60)
!65 = !DILocation(line: 54, column: 9, scope: !60)
!66 = !DILocation(line: 54, column: 27, scope: !60)
!67 = !DILocation(line: 56, column: 16, scope: !60)
!68 = !DILocation(line: 56, column: 14, scope: !60)
!69 = !DILocation(line: 58, column: 5, scope: !55)
!70 = !DILocation(line: 59, column: 1, scope: !55)
