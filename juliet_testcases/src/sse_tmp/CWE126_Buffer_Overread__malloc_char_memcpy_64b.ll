; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_64b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !22
  %1 = bitcast i8* %0 to i8**, !dbg !23
  store i8** %1, i8*** %dataPtr, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !26
  %3 = load i8*, i8** %2, align 8, !dbg !27
  store i8* %3, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !39
  %call = call i64 @strlen(i8* %arraydecay2) #7, !dbg !40
  %mul = mul i64 %call, 1, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %4, i64 %mul, i1 false), !dbg !37
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx3, align 1, !dbg !43
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @printLine(i8* %arraydecay4), !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  call void @free(i8* %5) #8, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !49 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !52, metadata !DIExpression()), !dbg !53
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !54
  %1 = bitcast i8* %0 to i8**, !dbg !55
  store i8** %1, i8*** %dataPtr, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i8** %data, metadata !56, metadata !DIExpression()), !dbg !57
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !58
  %3 = load i8*, i8** %2, align 8, !dbg !59
  store i8* %3, i8** %data, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !60, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !63
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !64
  store i8 0, i8* %arrayidx, align 1, !dbg !65
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !66
  %4 = load i8*, i8** %data, align 8, !dbg !67
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !68
  %call = call i64 @strlen(i8* %arraydecay2) #7, !dbg !69
  %mul = mul i64 %call, 1, !dbg !70
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %4, i64 %mul, i1 false), !dbg !66
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !71
  store i8 0, i8* %arrayidx3, align 1, !dbg !72
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !73
  call void @printLine(i8* %arraydecay4), !dbg !74
  %5 = load i8*, i8** %data, align 8, !dbg !75
  call void @free(i8* %5) #8, !dbg !76
  ret void, !dbg !77
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_64b_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 23, type: !17)
!19 = !DILocation(line: 23, column: 68, scope: !13)
!20 = !DILocalVariable(name: "dataPtr", scope: !13, file: !14, line: 26, type: !4)
!21 = !DILocation(line: 26, column: 14, scope: !13)
!22 = !DILocation(line: 26, column: 34, scope: !13)
!23 = !DILocation(line: 26, column: 24, scope: !13)
!24 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !5)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 21, scope: !13)
!27 = !DILocation(line: 28, column: 20, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 30, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 30, column: 14, scope: !29)
!34 = !DILocation(line: 31, column: 9, scope: !29)
!35 = !DILocation(line: 32, column: 9, scope: !29)
!36 = !DILocation(line: 32, column: 21, scope: !29)
!37 = !DILocation(line: 35, column: 9, scope: !29)
!38 = !DILocation(line: 35, column: 22, scope: !29)
!39 = !DILocation(line: 35, column: 35, scope: !29)
!40 = !DILocation(line: 35, column: 28, scope: !29)
!41 = !DILocation(line: 35, column: 40, scope: !29)
!42 = !DILocation(line: 36, column: 9, scope: !29)
!43 = !DILocation(line: 36, column: 21, scope: !29)
!44 = !DILocation(line: 37, column: 19, scope: !29)
!45 = !DILocation(line: 37, column: 9, scope: !29)
!46 = !DILocation(line: 38, column: 14, scope: !29)
!47 = !DILocation(line: 38, column: 9, scope: !29)
!48 = !DILocation(line: 40, column: 1, scope: !13)
!49 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_64b_goodG2BSink", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !49, file: !14, line: 47, type: !17)
!51 = !DILocation(line: 47, column: 72, scope: !49)
!52 = !DILocalVariable(name: "dataPtr", scope: !49, file: !14, line: 50, type: !4)
!53 = !DILocation(line: 50, column: 14, scope: !49)
!54 = !DILocation(line: 50, column: 34, scope: !49)
!55 = !DILocation(line: 50, column: 24, scope: !49)
!56 = !DILocalVariable(name: "data", scope: !49, file: !14, line: 52, type: !5)
!57 = !DILocation(line: 52, column: 12, scope: !49)
!58 = !DILocation(line: 52, column: 21, scope: !49)
!59 = !DILocation(line: 52, column: 20, scope: !49)
!60 = !DILocalVariable(name: "dest", scope: !61, file: !14, line: 54, type: !30)
!61 = distinct !DILexicalBlock(scope: !49, file: !14, line: 53, column: 5)
!62 = !DILocation(line: 54, column: 14, scope: !61)
!63 = !DILocation(line: 55, column: 9, scope: !61)
!64 = !DILocation(line: 56, column: 9, scope: !61)
!65 = !DILocation(line: 56, column: 21, scope: !61)
!66 = !DILocation(line: 59, column: 9, scope: !61)
!67 = !DILocation(line: 59, column: 22, scope: !61)
!68 = !DILocation(line: 59, column: 35, scope: !61)
!69 = !DILocation(line: 59, column: 28, scope: !61)
!70 = !DILocation(line: 59, column: 40, scope: !61)
!71 = !DILocation(line: 60, column: 9, scope: !61)
!72 = !DILocation(line: 60, column: 21, scope: !61)
!73 = !DILocation(line: 61, column: 19, scope: !61)
!74 = !DILocation(line: 61, column: 9, scope: !61)
!75 = !DILocation(line: 62, column: 14, scope: !61)
!76 = !DILocation(line: 62, column: 9, scope: !61)
!77 = !DILocation(line: 64, column: 1, scope: !49)
