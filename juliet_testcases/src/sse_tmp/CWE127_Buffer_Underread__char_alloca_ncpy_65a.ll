; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_65a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_65_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @CWE127_Buffer_Underread__char_alloca_ncpy_65b_badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !28
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  call void %4(i8* %5), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_65b_badSink(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_65_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #5, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #5, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_65_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_65_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !62, metadata !DIExpression()), !dbg !63
  store void (i8*)* @CWE127_Buffer_Underread__char_alloca_ncpy_65b_goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = alloca i8, i64 100, align 16, !dbg !66
  store i8* %0, i8** %dataBuffer, align 8, !dbg !65
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !68
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  store i8* %3, i8** %data, align 8, !dbg !72
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !73
  %5 = load i8*, i8** %data, align 8, !dbg !74
  call void %4(i8* %5), !dbg !73
  ret void, !dbg !75
}

declare dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_65b_goodG2BSink(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_65a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_65_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_65a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 30, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 30, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 31, type: !4)
!25 = !DILocation(line: 31, column: 12, scope: !13)
!26 = !DILocation(line: 31, column: 33, scope: !13)
!27 = !DILocation(line: 32, column: 12, scope: !13)
!28 = !DILocation(line: 32, column: 5, scope: !13)
!29 = !DILocation(line: 33, column: 5, scope: !13)
!30 = !DILocation(line: 33, column: 23, scope: !13)
!31 = !DILocation(line: 35, column: 12, scope: !13)
!32 = !DILocation(line: 35, column: 23, scope: !13)
!33 = !DILocation(line: 35, column: 10, scope: !13)
!34 = !DILocation(line: 37, column: 5, scope: !13)
!35 = !DILocation(line: 37, column: 13, scope: !13)
!36 = !DILocation(line: 38, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_65_good", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 61, column: 5, scope: !37)
!39 = !DILocation(line: 62, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 74, type: !41, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !43, !44}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !14, line: 74, type: !43)
!46 = !DILocation(line: 74, column: 14, scope: !40)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !14, line: 74, type: !44)
!48 = !DILocation(line: 74, column: 27, scope: !40)
!49 = !DILocation(line: 77, column: 22, scope: !40)
!50 = !DILocation(line: 77, column: 12, scope: !40)
!51 = !DILocation(line: 77, column: 5, scope: !40)
!52 = !DILocation(line: 79, column: 5, scope: !40)
!53 = !DILocation(line: 80, column: 5, scope: !40)
!54 = !DILocation(line: 81, column: 5, scope: !40)
!55 = !DILocation(line: 84, column: 5, scope: !40)
!56 = !DILocation(line: 85, column: 5, scope: !40)
!57 = !DILocation(line: 86, column: 5, scope: !40)
!58 = !DILocation(line: 88, column: 5, scope: !40)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", scope: !59, file: !14, line: 49, type: !4)
!61 = !DILocation(line: 49, column: 12, scope: !59)
!62 = !DILocalVariable(name: "funcPtr", scope: !59, file: !14, line: 50, type: !20)
!63 = !DILocation(line: 50, column: 12, scope: !59)
!64 = !DILocalVariable(name: "dataBuffer", scope: !59, file: !14, line: 51, type: !4)
!65 = !DILocation(line: 51, column: 12, scope: !59)
!66 = !DILocation(line: 51, column: 33, scope: !59)
!67 = !DILocation(line: 52, column: 12, scope: !59)
!68 = !DILocation(line: 52, column: 5, scope: !59)
!69 = !DILocation(line: 53, column: 5, scope: !59)
!70 = !DILocation(line: 53, column: 23, scope: !59)
!71 = !DILocation(line: 55, column: 12, scope: !59)
!72 = !DILocation(line: 55, column: 10, scope: !59)
!73 = !DILocation(line: 56, column: 5, scope: !59)
!74 = !DILocation(line: 56, column: 13, scope: !59)
!75 = !DILocation(line: 57, column: 1, scope: !59)
