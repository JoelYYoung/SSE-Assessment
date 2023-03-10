; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_64a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_64a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_64_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 50) #5, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !23
  %1 = load i8*, i8** %data, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %2 = bitcast i8** %data to i8*, !dbg !26
  call void @CWE126_Buffer_Overread__malloc_char_memmove_64b_badSink(i8* %2), !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_64b_badSink(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_64_good() #0 !dbg !29 {
entry:
  call void @goodG2B(), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !32 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !37, metadata !DIExpression()), !dbg !38
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !39, metadata !DIExpression()), !dbg !40
  %call = call i64 @time(i64* null) #5, !dbg !41
  %conv = trunc i64 %call to i32, !dbg !42
  call void @srand(i32 %conv) #5, !dbg !43
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !44
  call void @CWE126_Buffer_Overread__malloc_char_memmove_64_good(), !dbg !45
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !46
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !47
  call void @CWE126_Buffer_Overread__malloc_char_memmove_64_bad(), !dbg !48
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !49
  ret i32 0, !dbg !50
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !51 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !52, metadata !DIExpression()), !dbg !53
  store i8* null, i8** %data, align 8, !dbg !54
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !55
  store i8* %call, i8** %data, align 8, !dbg !56
  %0 = load i8*, i8** %data, align 8, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !58
  %1 = load i8*, i8** %data, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !59
  store i8 0, i8* %arrayidx, align 1, !dbg !60
  %2 = bitcast i8** %data to i8*, !dbg !61
  call void @CWE126_Buffer_Overread__malloc_char_memmove_64b_goodG2BSink(i8* %2), !dbg !62
  ret void, !dbg !63
}

declare dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_64b_goodG2BSink(i8*) #4

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_64a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_64_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_64a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocation(line: 29, column: 10, scope: !13)
!20 = !DILocation(line: 31, column: 20, scope: !13)
!21 = !DILocation(line: 31, column: 10, scope: !13)
!22 = !DILocation(line: 32, column: 12, scope: !13)
!23 = !DILocation(line: 32, column: 5, scope: !13)
!24 = !DILocation(line: 33, column: 5, scope: !13)
!25 = !DILocation(line: 33, column: 16, scope: !13)
!26 = !DILocation(line: 34, column: 61, scope: !13)
!27 = !DILocation(line: 34, column: 5, scope: !13)
!28 = !DILocation(line: 35, column: 1, scope: !13)
!29 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_64_good", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 57, column: 5, scope: !29)
!31 = !DILocation(line: 58, column: 1, scope: !29)
!32 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 70, type: !33, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !35, !36}
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!37 = !DILocalVariable(name: "argc", arg: 1, scope: !32, file: !14, line: 70, type: !35)
!38 = !DILocation(line: 70, column: 14, scope: !32)
!39 = !DILocalVariable(name: "argv", arg: 2, scope: !32, file: !14, line: 70, type: !36)
!40 = !DILocation(line: 70, column: 27, scope: !32)
!41 = !DILocation(line: 73, column: 22, scope: !32)
!42 = !DILocation(line: 73, column: 12, scope: !32)
!43 = !DILocation(line: 73, column: 5, scope: !32)
!44 = !DILocation(line: 75, column: 5, scope: !32)
!45 = !DILocation(line: 76, column: 5, scope: !32)
!46 = !DILocation(line: 77, column: 5, scope: !32)
!47 = !DILocation(line: 80, column: 5, scope: !32)
!48 = !DILocation(line: 81, column: 5, scope: !32)
!49 = !DILocation(line: 82, column: 5, scope: !32)
!50 = !DILocation(line: 84, column: 5, scope: !32)
!51 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 44, type: !15, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocalVariable(name: "data", scope: !51, file: !14, line: 46, type: !4)
!53 = !DILocation(line: 46, column: 12, scope: !51)
!54 = !DILocation(line: 47, column: 10, scope: !51)
!55 = !DILocation(line: 49, column: 20, scope: !51)
!56 = !DILocation(line: 49, column: 10, scope: !51)
!57 = !DILocation(line: 50, column: 12, scope: !51)
!58 = !DILocation(line: 50, column: 5, scope: !51)
!59 = !DILocation(line: 51, column: 5, scope: !51)
!60 = !DILocation(line: 51, column: 17, scope: !51)
!61 = !DILocation(line: 52, column: 65, scope: !51)
!62 = !DILocation(line: 52, column: 5, scope: !51)
!63 = !DILocation(line: 53, column: 1, scope: !51)
