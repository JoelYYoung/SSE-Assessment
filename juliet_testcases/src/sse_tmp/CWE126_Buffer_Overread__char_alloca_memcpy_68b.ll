; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_68b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__char_alloca_memcpy_68_badData = external dso_local global i8*, align 8
@CWE126_Buffer_Overread__char_alloca_memcpy_68_goodG2BData = external dso_local global i8*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_alloca_memcpy_68_badData, align 8, !dbg !17
  store i8* %0, i8** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !18, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !29
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !30
  %mul = mul i64 %call, 1, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !27
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !32
  store i8 0, i8* %arrayidx3, align 1, !dbg !33
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !34
  call void @printLine(i8* %arraydecay4), !dbg !35
  ret void, !dbg !36
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_68b_goodG2BSink() #0 !dbg !37 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_alloca_memcpy_68_goodG2BData, align 8, !dbg !40
  store i8* %0, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx, align 1, !dbg !46
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  %1 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !50
  %mul = mul i64 %call, 1, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !47
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx3, align 1, !dbg !53
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @printLine(i8* %arraydecay4), !dbg !55
  ret void, !dbg !56
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 30, column: 12, scope: !9)
!17 = !DILocation(line: 30, column: 19, scope: !9)
!18 = !DILocalVariable(name: "dest", scope: !19, file: !10, line: 32, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 32, column: 14, scope: !19)
!24 = !DILocation(line: 33, column: 9, scope: !19)
!25 = !DILocation(line: 34, column: 9, scope: !19)
!26 = !DILocation(line: 34, column: 21, scope: !19)
!27 = !DILocation(line: 37, column: 9, scope: !19)
!28 = !DILocation(line: 37, column: 22, scope: !19)
!29 = !DILocation(line: 37, column: 35, scope: !19)
!30 = !DILocation(line: 37, column: 28, scope: !19)
!31 = !DILocation(line: 37, column: 40, scope: !19)
!32 = !DILocation(line: 38, column: 9, scope: !19)
!33 = !DILocation(line: 38, column: 21, scope: !19)
!34 = !DILocation(line: 39, column: 19, scope: !19)
!35 = !DILocation(line: 39, column: 9, scope: !19)
!36 = !DILocation(line: 41, column: 1, scope: !9)
!37 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_68b_goodG2BSink", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", scope: !37, file: !10, line: 50, type: !14)
!39 = !DILocation(line: 50, column: 12, scope: !37)
!40 = !DILocation(line: 50, column: 19, scope: !37)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !10, line: 52, type: !20)
!42 = distinct !DILexicalBlock(scope: !37, file: !10, line: 51, column: 5)
!43 = !DILocation(line: 52, column: 14, scope: !42)
!44 = !DILocation(line: 53, column: 9, scope: !42)
!45 = !DILocation(line: 54, column: 9, scope: !42)
!46 = !DILocation(line: 54, column: 21, scope: !42)
!47 = !DILocation(line: 57, column: 9, scope: !42)
!48 = !DILocation(line: 57, column: 22, scope: !42)
!49 = !DILocation(line: 57, column: 35, scope: !42)
!50 = !DILocation(line: 57, column: 28, scope: !42)
!51 = !DILocation(line: 57, column: 40, scope: !42)
!52 = !DILocation(line: 58, column: 9, scope: !42)
!53 = !DILocation(line: 58, column: 21, scope: !42)
!54 = !DILocation(line: 59, column: 19, scope: !42)
!55 = !DILocation(line: 59, column: 9, scope: !42)
!56 = !DILocation(line: 61, column: 1, scope: !37)
