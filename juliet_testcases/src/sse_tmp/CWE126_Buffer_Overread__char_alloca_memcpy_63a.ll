; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_63a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_63_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %6, i8** %data, align 8, !dbg !34
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_63b_badSink(i8** %data), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_63b_badSink(i8**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_63_good() #0 !dbg !37 {
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
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_63_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_63_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = alloca i8, i64 50, align 16, !dbg !64
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !65, metadata !DIExpression()), !dbg !66
  %1 = alloca i8, i64 100, align 16, !dbg !67
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !66
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !69
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !70
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !70
  store i8 0, i8* %arrayidx, align 1, !dbg !71
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !73
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !74
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !74
  store i8 0, i8* %arrayidx1, align 1, !dbg !75
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !76
  store i8* %6, i8** %data, align 8, !dbg !77
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_63b_goodG2BSink(i8** %data), !dbg !78
  ret void, !dbg !79
}

declare dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_63b_goodG2BSink(i8**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_63a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_63_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_63a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 29, type: !4)
!20 = !DILocation(line: 29, column: 12, scope: !13)
!21 = !DILocation(line: 29, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 30, type: !4)
!23 = !DILocation(line: 30, column: 12, scope: !13)
!24 = !DILocation(line: 30, column: 37, scope: !13)
!25 = !DILocation(line: 31, column: 12, scope: !13)
!26 = !DILocation(line: 31, column: 5, scope: !13)
!27 = !DILocation(line: 32, column: 5, scope: !13)
!28 = !DILocation(line: 32, column: 25, scope: !13)
!29 = !DILocation(line: 33, column: 12, scope: !13)
!30 = !DILocation(line: 33, column: 5, scope: !13)
!31 = !DILocation(line: 34, column: 5, scope: !13)
!32 = !DILocation(line: 34, column: 27, scope: !13)
!33 = !DILocation(line: 36, column: 12, scope: !13)
!34 = !DILocation(line: 36, column: 10, scope: !13)
!35 = !DILocation(line: 37, column: 5, scope: !13)
!36 = !DILocation(line: 38, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_63_good", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 63, column: 5, scope: !37)
!39 = !DILocation(line: 64, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 76, type: !41, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !43, !44}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !14, line: 76, type: !43)
!46 = !DILocation(line: 76, column: 14, scope: !40)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !14, line: 76, type: !44)
!48 = !DILocation(line: 76, column: 27, scope: !40)
!49 = !DILocation(line: 79, column: 22, scope: !40)
!50 = !DILocation(line: 79, column: 12, scope: !40)
!51 = !DILocation(line: 79, column: 5, scope: !40)
!52 = !DILocation(line: 81, column: 5, scope: !40)
!53 = !DILocation(line: 82, column: 5, scope: !40)
!54 = !DILocation(line: 83, column: 5, scope: !40)
!55 = !DILocation(line: 86, column: 5, scope: !40)
!56 = !DILocation(line: 87, column: 5, scope: !40)
!57 = !DILocation(line: 88, column: 5, scope: !40)
!58 = !DILocation(line: 90, column: 5, scope: !40)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", scope: !59, file: !14, line: 49, type: !4)
!61 = !DILocation(line: 49, column: 12, scope: !59)
!62 = !DILocalVariable(name: "dataBadBuffer", scope: !59, file: !14, line: 50, type: !4)
!63 = !DILocation(line: 50, column: 12, scope: !59)
!64 = !DILocation(line: 50, column: 36, scope: !59)
!65 = !DILocalVariable(name: "dataGoodBuffer", scope: !59, file: !14, line: 51, type: !4)
!66 = !DILocation(line: 51, column: 12, scope: !59)
!67 = !DILocation(line: 51, column: 37, scope: !59)
!68 = !DILocation(line: 52, column: 12, scope: !59)
!69 = !DILocation(line: 52, column: 5, scope: !59)
!70 = !DILocation(line: 53, column: 5, scope: !59)
!71 = !DILocation(line: 53, column: 25, scope: !59)
!72 = !DILocation(line: 54, column: 12, scope: !59)
!73 = !DILocation(line: 54, column: 5, scope: !59)
!74 = !DILocation(line: 55, column: 5, scope: !59)
!75 = !DILocation(line: 55, column: 27, scope: !59)
!76 = !DILocation(line: 57, column: 12, scope: !59)
!77 = !DILocation(line: 57, column: 10, scope: !59)
!78 = !DILocation(line: 58, column: 5, scope: !59)
!79 = !DILocation(line: 59, column: 1, scope: !59)
